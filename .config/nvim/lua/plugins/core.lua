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
    opts = {
      options = { theme = "solarized_dark" },
    }
  },
  {
    "cvigilv/diferente.nvim",
    opts = {
    }
  },
  {
    "editorconfig/editorconfig-vim",
    config = function()
      vim.g.EditorConfig_exclude_patterns = { "fugitive://.*" }
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {

    }
  },
  {
    "Pocco81/auto-save.nvim",
    opts = {
      debounce_delay = 500,
      execution_message = {
        message = function() -- message to print on save
          return ("AutoSaved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18, -- dim the color of `message`
        cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
      },
    },
  },
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
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
