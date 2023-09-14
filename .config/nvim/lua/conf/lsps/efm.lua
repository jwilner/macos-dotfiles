local efmlanguages = {}
for lang, conf in require("conf").get_modules("efm") do
  efmlanguages[lang] = conf
end

return {
  on_attach = require("lsp-format").on_attach,
  filetypes = vim.tbl_keys(efmlanguages),
  settings = {
    rootMarkers = { ".git/" },
    languages = efmlanguages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}
