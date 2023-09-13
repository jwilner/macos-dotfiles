vim.g.ale_fix_on_save = true -- autoformatting Go files is the norm
vim.b.ale_fixers = { "gopls", "remove_trailing_lines", "trim_whitespace" }
