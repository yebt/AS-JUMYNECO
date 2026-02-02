local M = {}

-- Ruta del archivo de caché
local cache_path = vim.fn.stdpath "cache" .. "/formatter_prefs.json"

local function load_prefs()
  local f = io.open(cache_path, "r")
  if not f then return {} end
  local content = f:read "*a"
  f:close()
  return vim.json.decode(content) or {}
end

local function save_pref(filetype, client_name)
  local prefs = load_prefs()
  local project_root = vim.fs.root(0, { ".git", ".nvim" }) or "global"

  if not prefs[project_root] then prefs[project_root] = {} end
  prefs[project_root][filetype] = client_name

  local f = io.open(cache_path, "w")
  if f then
    f:write(vim.json.encode(prefs))
    f:close()
    print("Formatteador '" .. client_name .. "' guardado para " .. filetype)
  end
end

function M.select_formatter(set_default)
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype
  local clients = vim.lsp.get_clients { bufnr = bufnr, method = "textDocument/formatting" }

  if #clients == 0 then
    print "No se encontraron LSPs con capacidad de formateo."
    return
  end

  local options = {}
  for _, client in ipairs(clients) do
    table.insert(options, client.name)
  end

  -- Si no estamos en el modo "set_default", añadimos la opción mágica
  if not set_default then table.insert(options, 1, "⭐ Configurar por defecto para este proyecto") end

  vim.ui.select(options, {
    prompt = set_default and "Selecciona cliente PERMANENTE (" .. ft .. "):" or "Seleccionar Formateador:",
  }, function(choice)
    if not choice then return end

    if choice == "⭐ Configurar por defecto para este proyecto" then
      -- Llamada recursiva activando el flag de guardado
      M.select_formatter(true)
    else
      if set_default then save_pref(ft, choice) end

      -- Ejecutar el formateo con el cliente elegido
      vim.lsp.buf.format {
        name = choice,
        async = true,
      }
    end
  end)
end

-- Comando para invocarlo
-- vim.api.nvim_create_user_command("FormatSelect", function() M.select_formatter() end, {})

return M
