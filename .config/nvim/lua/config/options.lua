-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.opt.fillchars = {
  horiz = "━",
  vert = "▕", -- alternatives │,
  fold = " ",
  eob = " ", -- suppress ~ at EndOfBuffer
  diff = "╱", -- alts: = ⣿ ░ ─
  msgsep = " ", -- alts: ‾ ─
}
