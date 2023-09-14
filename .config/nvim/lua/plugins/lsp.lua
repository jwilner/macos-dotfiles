return {
  {
    "neovim/nvim-lspconfig",
    config = require("conf").configure_lsps,
  },
  {
    "creativenull/efmls-configs-nvim",
    version = "v1.x.x", -- version is optional, but recommended
    dependencies = { "neovim/nvim-lspconfig" },
  },
  "lukas-reineke/lsp-format.nvim",
}
