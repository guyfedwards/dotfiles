return {
	"danymat/neogen",
	opts = {},
	keys = {
		{
			"<leader>dd",
			function()
				require("neogen").generate()
			end,
			mode = { "n", "v" },
			noremap = true,
			silent = true,
			desc = "Generate annotations (neogen)",
		},
	},
}
