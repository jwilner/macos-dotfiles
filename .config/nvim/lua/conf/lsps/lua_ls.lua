local cfg = require('lsp-zero').nvim_lua_ls()
-- prefer the stylua formatting
cfg.on_init = function(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentFormattingRangeProvider = false
end
return cfg
