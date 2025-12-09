return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		keymaps = {
			["<C-h>"] = false,
			["<M-h>"] = "actions.select_split",
		},
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
		{
			"-",
			"<cmd>Oil<cr>",
			desc = "Open parent directory",
		},
	},
}
