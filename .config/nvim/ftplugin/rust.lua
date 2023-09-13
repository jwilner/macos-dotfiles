vim.b.ale_fixers = { "rustfmt" }
vim.g.ale_fix_on_save = true
vim.g.ale_rust_cargo_use_clippy = vim.fn.executable("cargo-clippy") == 1
