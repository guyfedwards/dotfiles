return {
	"ibhagwan/fzf-lua",
	lazy = false,
	opts = {
		"fzf-vim",
		winopts = {
			width = 1,
			height = 0.4,
			row = 1, -- window row position (0=top, 1=bottom)
			col = 0, -- window col position (0=left, 1=right)
			border = "rounded",
			title_flags = false,
			backdrop = 80,
			preview = {
				hidden = false,
				default = "bat",
				title = false,
			},
		},
		fzf_opts = {
			["--ansi"] = true,
			["--prompt"] = "> ",
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
		{
			"\\",
			":Rg ",
			"n",
		},
		{
			"\\",
			function()
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

				local t = get_visual_selection()
				vim.cmd(":Rg " .. t)
			end,
			"v",
			noremap = true,
		},
	},
}
