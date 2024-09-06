return {
  {
    dependencies = {
      { "L3MON4D3/LuaSnip" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/nvim-cmp" },
      { "neovim/nvim-lspconfig" },
      { "petertriho/cmp-git",               dependencies = { "nvim-lua/plenary.nvim" } },
      { "saadparwaiz1/cmp_luasnip" },
      { "stevearc/conform.nvim" },
      { "rafamadriz/friendly-snippets" },
      { "williamboman/mason-lspconfig.nvim" },
      { "williamboman/mason.nvim" },
    },
    lazy = false,
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    config = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
        lsp_zero.buffer_autoformat()
      end)

      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()
      local cmp_format = require('lsp-zero').cmp_format({ details = true })

      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        formatting = cmp_format,
        sources = {
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "git" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = 'buffer' },
          { name = 'nvim_lsp' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
          ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
          ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item({ behavior = 'insert' })
            else
              cmp.complete()
            end
          end),
          ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item({ behavior = 'insert' })
            else
              cmp.complete()
            end
          end),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        },
      })
    end
  },
}
-- return {
-- 	{
-- 		dependencies = {
--       {"williamboman/mason-lspconfig.nvim"},
--       {"williamboman/mason.nvim"},
-- 			{ "neovim/nvim-lspconfig" },
-- 			{ "hrsh7th/cmp-nvim-lsp" },
-- 			{ "hrsh7th/nvim-cmp" },
-- 			{ "hrsh7th/cmp-buffer" },
-- 			{ "hrsh7th/cmp-path" },
-- 			{ "hrsh7th/cmp-nvim-lua" },
-- 			{ "petertriho/cmp-git", dependencies = { "nvim-lua/plenary.nvim" } },
-- 			{ "L3MON4D3/LuaSnip" },
-- 			{ "saadparwaiz1/cmp_luasnip" },
-- 			{ "stevearc/conform.nvim" },
-- 		},
-- 		lazy = false,
-- 		"VonHeikemen/lsp-zero.nvim",
-- 		branch = "v3.x",
-- 		config = function()
-- 			-- LSP
-- 			local lsp_zero = require("lsp-zero")
-- 			local lsp_attach = function(client, bufnr)
-- 				local opts = { buffer = bufnr }
-- 				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
-- 				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
-- 				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
-- 				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
-- 				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
-- 				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
-- 				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
-- 				vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
-- 				vim.keymap.set(
-- 					{ "n", "x" },
-- 					"<F3>",
-- 					"<cmd>lua vim.lsp.buf.format()<cr>",
-- 					opts
-- 				)
-- 				vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- 			end
--
-- 			lsp_zero.extend_lspconfig({
-- 				sign_text = true,
-- 				lsp_attach = lsp_attach,
-- 				capabilities = require("cmp_nvim_lsp").default_capabilities(),
-- 			})
--
-- 			-- CMP
-- 			local cmp = require("cmp")
-- 			local cmp_action = require("lsp-zero").cmp_action()
-- 			local cmp_format = require("lsp-zero").cmp_format({ details = true })
--
-- 			require("luasnip.loaders.from_lua").lazy_load()
--
-- 			cmp.setup({
-- 				sources = {
-- 					{ name = "nvim_lua" },
-- 					{ name = "nvim_lsp" },
-- 					{ name = "git" },
-- 					{ name = "luasnip" },
-- 					{ name = "buffer" },
-- 					{ name = "path" },
-- 				},
-- 				formatting = cmp_format,
-- 				snippet = {
-- 					expand = function(args)
-- 						require("luasnip").lsp_expand(args.body)
-- 					end,
-- 				},
-- 				mapping = cmp.mapping.preset.insert({
-- 					["<CR>"] = cmp.mapping.confirm({ select = false }),
-- 				}),
-- 				preselect = "item",
-- 				completion = {
-- 					completeopt = "menu,menuone,noinsert",
-- 				},
-- 				window = {
-- 					completion = cmp.config.window.bordered(),
-- 					documentation = cmp.config.window.bordered(),
-- 				},
-- 			})
--
-- 			-- MASON
-- 			require("mason").setup({})
-- 			require("mason-lspconfig").setup({
-- 				ensure_installed = { "lua_ls" },
-- 				handlers = {
-- 					function(server_name)
-- 						require("lspconfig")[server_name].setup({})
-- 					end,
-- 				},
-- 			})
-- 		end,
-- 	},
-- }
