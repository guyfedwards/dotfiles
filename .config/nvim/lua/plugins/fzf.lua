return {
	"ibhagwan/fzf-lua",
	opts = {
		winopts = {
			width = 1,
			height = 0.4,
			row = 1, -- window row position (0=top, 1=bottom)
			col = 0, -- window col position (0=left, 1=right)
			border = "rounded",
			title_flags = false,
			backdrop = 80,
			preview = {
				default = "bat",
				title = false,
			},
		},
		fzf_opts = {
			["--ansi"] = true,
			["--prompt"] = ">",
			["--height"] = "100%",
			["--layout"] = false,
			["--info"] = "default",
			["--highlight-line"] = true, -- fzf >= v0.53
		},
	},
	keys = {
		{
			"<C-p>",
			function()
				require("fzf-lua").files()
			end,
			"n",
			desc = "FZF files",
		},
		{
			"<C-b>",
			function()
				require("fzf-lua").buffers()
			end,
			"n",
			desc = "FZF buffers",
		},
	},
}
