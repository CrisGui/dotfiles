return {
	event = "VeryLazy",
	main = "conform",
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			assembly = { "asmfmt" },
			bash = { "shfmt" },
			c = { "clang-format" },
			cmake = { "cmakelang" },
			cpp = { "clang-format" },
			go = { "crlfmt" },
			json = { "clang-format" },
			lua = { "stylua" },
			markdown = { "markdownlint-cli2" },
			python = { "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
			["_"] = { "trim_whitespace" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- format_on_save = {
		-- 	timeout_ms = 1000,
		-- 	lsp_format = "fallback",
		-- },
	},
}
