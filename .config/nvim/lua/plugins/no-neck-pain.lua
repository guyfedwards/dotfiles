return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	keys = {
		{
			"<leader>np",
			function()
				require("no-neck-pain").toggle()
			end,
		},
	},
}
