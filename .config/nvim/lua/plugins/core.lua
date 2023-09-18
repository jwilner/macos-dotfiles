return {

  "tpope/vim-fugitive",
  "tpope/vim-sleuth",

  {
    "lifepillar/vim-solarized8",
    lazy = false, -- load on startup
    priority = 1000, -- load before all others
    config = function()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("solarized8")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "solarized_dark" },
      })
    end,
  },
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
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  "Pocco81/auto-save.nvim",
  "nvim-lua/plenary.nvim",
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("telescope").setup({
        extensions = {
          file_browser = {
            hijack_netrw = true,
          },
        },
      })
      -- open file_browser with the path of the current buffer
      vim.api.nvim_set_keymap(
        "n",
        "<space>fb",
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        { noremap = true }
      )

      require("telescope").load_extension("file_browser")
    end,
  },
  "direnv/direnv.vim",
}
