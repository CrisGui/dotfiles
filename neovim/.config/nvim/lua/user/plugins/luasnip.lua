return {
	{
		-- Dependency
		main = "luasnip",
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip").config.set_config({
				enable_autosnippets = true,
			})
			require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/lua/user/snippets" })
		end,
	},
}
