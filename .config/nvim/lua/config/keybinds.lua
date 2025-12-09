local g = vim.g
local k = vim.keymap
local cmd = cmd

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
g.mapleader = ","
g.maplocalleader = "\\"

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

-- \ calls :Rg, if visual selection, call :Rg <selection>
k.set("v", "\\", function()
	local t = get_visual_selection()
	cmd("Rg " .. t)
end, { noremap = true })

function get_visual_selection()
	-- exit visual mode so '< and '> are populated correctly
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "x", true)

	local s_start = vim.fn.getpos("'<")
	local s_end = vim.fn.getpos("'>")

	local n_lines = math.abs(s_end[2] - s_start[2]) + 1
	local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)

	lines[1] = string.sub(lines[1], s_start[3], -1)

	if n_lines == 1 then
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
	else
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
	end
	return table.concat(lines, "\n")
end
