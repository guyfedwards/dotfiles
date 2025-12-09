return {
	"dense-analysis/ale",
	lazy = false,
	config = function()
		local g = vim.g

		g.ale_fix_on_save = 1

		g.ale_linters = {
			javascript = { "eslint", "standard" },
			lua = { "luacheck" },
			sh = { "shellcheck" },
			go = { "golangci-lint" },
			sql = { "sqlint" },
			typescript = { "eslint" },
			rust = { "analyzer" },
			proto = { "protolint" },
		}

		g.ale_fixers = {
			javascript = { "prettier", "eslint", "standard" },
			javascriptreact = { "prettier", "eslint", "standard" },
			typescriptreact = { "prettier", "eslint", "standard" },
			typescript = { "prettier", "eslint", "standard" },
			go = { "gopls" },
			lua = { "stylua" },
			json = { "fixjson" },
			sql = { "pgformatter" },
			rust = { "rustfmt" },
			terraform = { "terraform" },
		}

		g.ale_javascript_eslint_executable = "eslint_d"
		g.ale_javascript_eslint_use_global = 1
		g.ale_javascript_prettier_use_local_config = 1
		g.ale_sql_sqlfmt_executable = "sqlfmt"
		-- g.ale_sign_error = '●'
		-- g.ale_sign_warning = '●'
		-- g.ale_sign_column_always = 1
		g.ale_completion_autoimport = 0
		g.ale_echo_msg_format = "%linter%:%code%: %s"
		-- we are using nvim-lsp
		g.ale_disable_lsp = 1
		-- enable linting package not just file
		g.ale_go_golangci_lint_package = 1

		vim.cmd("highlight clear ALEErrorSign")
		vim.cmd("highlight clear ALEWarningSign")
	end,
	keys = {
		{ "<leader>ad", "<cmd>ALEDetail<cr>" },
	},
}
