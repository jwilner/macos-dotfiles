local M = {}

function M.get_modules(type)
  local files = vim.api.nvim_get_runtime_file("lua/conf/" .. type .. "/*.lua", true)
  local i = 0
  return function()
    i = i + 1
    if i <= #files then
      local modname = files[i]:gsub(".*lua/conf/" .. type .. "/(.*).lua", "conf." .. type .. ".%1")
      local basename = modname:gsub(".*%.(.-)", "%1")
      return basename, require(modname)
    end
  end
end

function M.configure_lsps()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local lspconfig = require("lspconfig")

  for name, options in M.get_modules("lsps") do
    if options.name then
      options = options.options
    end
    if not options then
      options = {}
    end
    options.capabilities = capabilities
    lspconfig[name].setup(options)
  end
end

return M
