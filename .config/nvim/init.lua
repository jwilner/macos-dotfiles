local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
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
  {
    "vim-airline/vim-airline",
    config = function()
      -- airline/ALE: enable vim-airline integration with ALE
      vim.g["airline#extensions#ale#enabled"] = 1
    end,
  },
  "tpope/vim-sleuth",
  "preservim/nerdtree",
  {
    "editorconfig/editorconfig-vim",
    config = function()
      vim.g.EditorConfig_exclude_patterns = { "fugitive://.*" }
    end,
  },
  "lewis6991/gitsigns.nvim",
  "Pocco81/auto-save.nvim",
  "w0rp/ale",
})

vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamed"
