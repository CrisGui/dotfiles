---@diagnostic disable: undefined-global
local mapkey = require("user.core.utilities").mapkey

return {
	event = "VeryLazy",
	main = "lsp-zero",
	"VonHeikemen/lsp-zero.nvim",
	branch = "v4.x",
	dependencies = { "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp", "hrsh7th/nvim-cmp" },
	config = function()
		local lsp_zero = require("lsp-zero")

		local lsp_attach = function(client, bufnr)
			mapkey("n", "K", function()
				vim.lsp.buf.hover()
			end, { buffer = bufnr, desc = "[K]wonledge" })
			mapkey("n", "gd", function()
				vim.lsp.buf.definition()
			end, { buffer = bufnr, desc = "[g]o [d]efinition" })
			mapkey("n", "gD", function()
				vim.lsp.buf.declaration()
			end, { buffer = bufnr, desc = "[g]o [D]eclaration" })
			mapkey("n", "gi", function()
				vim.lsp.buf.implementation()
			end, { buffer = bufnr, desc = "[g]o [i]mplementation" })
			mapkey("n", "gt", function()
				vim.lsp.buf.type_definition()
			end, { buffer = bufnr, desc = "[g]o [t]ype definition" })
			mapkey("n", "gr", function()
				vim.lsp.buf.references()
			end, { buffer = bufnr, desc = "[g]o [r]eferences" })
			mapkey("n", "gs", function()
				vim.lsp.buf.signature_help()
			end, { buffer = bufnr, desc = "[g]o [s]ignature" })
			mapkey("n", "<F7>", function()
				vim.lsp.buf.rename()
			end, { buffer = bufnr, desc = "" })
			mapkey({ "n", "x" }, "<F6>", function()
				require("conform").format({
					bufnr = vim.api.nvim_get_current_buf(),
					timeout_ms = 1000,
					async = true,
					lsp_format = "fallback",
					quiet = true,
				})
			end, { buffer = bufnr, desc = "Format code" })
			mapkey("n", "<F5>", function()
				vim.lsp.buf.code_action()
			end, { buffer = bufnr, desc = "Show available code actions" })
		end

		lsp_zero.extend_lspconfig({
			sign_text = true,
			lsp_attach = lsp_attach,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
	end,
}
