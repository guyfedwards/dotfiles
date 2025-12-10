-- Plugin specific keybinds live in the respective plugins/*.lua file
local g = vim.g
local k = vim.keymap
local cmd = cmd

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
g.mapleader = ","
g.maplocalleader = ","

-- leader shortcuts
k.set("", "<leader><leader>", "<c-^>")

-- Quickly edit/reload the vimrc file
k.set("n", "<leader>ev", ":tabnew $MYVIMRC <bar> :vnew $HOME/.config/nvim<cr>", { noremap = true, silent = true })
k.set("n", "<leader>sv", ":so $MYVIMRC<cr>", { noremap = true, silent = true })

-- turn off search highlight
k.set("n", "<leader><space>", ":nohlsearch<cr>", { noremap = true })

-- toggle scrolloff between 999 and 0. 999 keeps line center screen
k.set("n", "<leader>zz", ":let &scrolloff=999-&scrolloff<CR>", { noremap = true })

-- select text that was just pasted
k.set("n", "<leader>v", "V`]", { noremap = true })

-- invert yank on paste. Normal paste won't yank selection, P will
k.set("x", "p", "P", { noremap = true })
k.set("x", "P", "p", { noremap = true })

-- easy window navigation
k.set("", "<C-h>", "<C-w>h")
k.set("", "<C-j>", "<C-w>j")
k.set("", "<C-k>", "<C-w>k")
k.set("", "<C-l>", "<C-w>l")

-- unbind Q
k.set("", "Q", "<Nop>")

-- F3 for date
k.set("", "<F3>", ':.-1r! date +"%a %b %d %T %Z %Y || %s"<CR>')

-- replace all in file
k.set("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>', { noremap = true })

-- move vertically by visual line
k.set("n", "j", "gj", { noremap = true })
k.set("n", "k", "gk", { noremap = true })

-- highlight last inserted text
k.set("n", "gV", "`[v`]", { noremap = true })
