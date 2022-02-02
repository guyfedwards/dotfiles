local neogen = require("neogen")

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>dd", ":lua require('neogen').generate()<CR>", opts)

neogen.setup {
  enabled = true
}
