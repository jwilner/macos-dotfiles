return {
  {
    "lifepillar/vim-solarized8",
    lazy = false, -- load on startup
    priority = 1000, -- load before all others
    config = function()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("solarized8")
    end,
  },
  "tpope/vim-fugitive",
  "vim-airline/vim-airline",
  "tpope/vim-sleuth",
  "preservim/nerdtree",
  {
    "cvigilv/diferente.nvim",
    config = function()
      require("diferente").setup()
    end,
  },
  {
    "editorconfig/editorconfig-vim",
    config = function()
      vim.g.EditorConfig_exclude_patterns = { "fugitive://.*" }
    end,
  },
  "lewis6991/gitsigns.nvim",
  "Pocco81/auto-save.nvim",
}
