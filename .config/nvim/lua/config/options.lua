local o = vim.opt
local b = vim.bo
local cmd = vim.cmd
local fn = vim.fn

-- =====================
-- General
-- =====================
-- allow unsaved buffers in background, but check on quit
o.confirm = true
o.backspace = [[indent,eol,start]]
o.undofile = true
o.scrolloff = 3
o.timeoutlen = 500

if fn.executable("rg") == 1 then
	o.grepprg = "rg --vimgrep"
end

-- trim whitespace on save unless markdown
vim.api.nvim_create_autocmd("bufwritepre", {
	pattern = "*",
	callback = function()
		if b.filetype == "markdown" then
			return
		end

		local curpos = vim.api.nvim_win_get_cursor(0)

		cmd([[%s/\s\+$//e]])
		vim.api.nvim_win_set_cursor(0, curpos)
	end,
})

-- =====================
-- Spaces & Tabs
-- =====================
-- number of visual spaces per TAB
o.tabstop = 2
-- number of spaces in tab when editing
o.softtabstop = 2
-- indentation with << and >>
o.shiftwidth = 2
-- tabs are spaces
o.expandtab = true
-- use multiple of shiftwidth when indenting with < and >
o.shiftround = true
-- copy the indentation on autoindenting
o.copyindent = true

-- =====================
-- Colors
-- =====================
o.termguicolors = true
-- Highlights
-- ----------
cmd.highlight("LineNr ctermfg=NONE ctermbg=NONE")
cmd.highlight("VertSplit ctermbg=NONE guibg=#191E21 guifg=#293136")
-- transparent gutter
cmd.highlight("SignColumn guibg=NONE ctermbg=NONE")
o.signcolumn = "yes"
-- transparent line numbers
cmd.highlight("LineNr guibg=NONE ctermbg=NONE")

-- =====================
-- UI
-- =====================
-- show line numbers
o.number = true
o.relativenumber = true
-- highlight current line
o.cursorline = true
-- visual autocomplete for command menu
o.wildmenu = true
-- redraw only when we need to.
o.lazyredraw = true
-- highlight matching [{()}]
o.showmatch = true
-- show line at 81 chars, stop before the line
o.colorcolumn = "81"
-- Smaller updatetime for CursorHold & CursorHoldI
o.updatetime = 300
-- Open new panes to right and bottom
o.splitbelow = true
o.splitright = true

o.fillchars = {
	horiz = "━",
	vert = "▕", -- alternatives │,
	fold = " ",
	eob = " ", -- suppress ~ at EndOfBuffer
	diff = "╱", -- alts: = ⣿ ░ ─
	msgsep = " ", -- alts: ‾ ─
}

-- =====================
-- Searching
-- =====================
-- search as characters are entered
o.incsearch = true
-- highlight matches
o.hlsearch = true
-- ignore case when searching
o.ignorecase = true
-- ignore case if search pattern is all lowercase,
-- case-sensitive otherwise
o.smartcase = true

-- =====================
-- Folding
-- =====================
-- enable folding
o.foldenable = true
-- open most folds by default
o.foldlevelstart = 10
-- 10 nested fold max
o.foldnestmax = 10
-- fold based on indent level
o.foldmethod = "indent"

-- =====================
-- Syntax related
-- =====================
cmd([[autocmd BufNewFile,BufReadPost *.md set filetype=markdown]])
cmd([[autocmd BufNewFile,BufReadPost *config set filetype=config]])
