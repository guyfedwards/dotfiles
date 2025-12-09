return {
	"preservim/nerdtree",
	opts = {},
	config = function()
		-- TODO: make more lua
		vim.cmd([[
			autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
			let NERDTreeShowHidden=1
			let NERDTreeAutoDeleteBuffer = 1
			let NERDTreeMinimalUI = 1
			let g:NERDTreeMinimalMenu=1
			let g:NERDTreeFileExtensionHighlightFullName = 1
			let g:NERDTreeExactMatchHighlightFullName = 1
			let g:NERDTreePatternMatchHighlightFullName = 1
			" set the color for files ending with _spec.r
			" this line is needed to avoid error
			let g:NERDTreePatternMatchHighlightColor = {}
			let g:NERDTreePatternMatchHighlightColor['.*\.rb$'] = 'a9535b'
			let g:NERDTreePatternMatchHighlightColor['.*\.go$'] = '5485e5'
			" autocmd StdinReadPre * let s:std_in=1
			autocmd VimEnter,TabEnter * wincmd p
		]])
	end,
	keys = {
		{
			"<leader>nt",
			"<cmd>NERDTreeToggle<cr>",
		},
		{
			"<leader>nn",
			"<cmd>NERDTreeFind<cr>",
		},
	},
}
