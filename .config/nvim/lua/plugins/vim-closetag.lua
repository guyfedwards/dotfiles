return {
	"alvan/vim-closetag",
	ft = { "html", "jsx", "javascript", "javascript.jsx" },
	config = function()
		local g = vim.g

		g.closetag_emptyTags_caseSensitive = 1
		g.closetag_filenames = { "*.html", "*.xhtml", "*.phtml", "*.js", "*.jsx", "*.tsx" }
	end,
}
