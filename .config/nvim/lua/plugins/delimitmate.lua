return {
	"raimondi/delimitMate",
	config = function()
		local autocmd = vim.api.nvim_create_autocmd
		vim.g.delimitMate_expand_cr = 1

		autocmd("FileType", {
			pattern = {
				"xml",
				"html",
				"phtml",
				"php",
				"xhtml",
				"js",
				"jsx",
				"ts",
				"tsx",
				"javascript",
				"javascript.jsx",
			},
			command = 'let b:delimitMate_matchpairs = "(:),[:],{:}"',
		})
	end,
}
