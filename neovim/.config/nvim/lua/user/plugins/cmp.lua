return {
  main = "cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind.nvim" ,
"L3MON4D3/LuaSnip",
"neovim/nvim-lspconfig",

"hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    {
      "petertriho/cmp-git",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
"hrsh7th/cmp-buffer",
"hrsh7th/cmp-path",
"hrsh7th/cmp-cmdline",
"saadparwaiz1/cmp_luasnip",
  },
  opts = function()
		local lspkind = require("lspkind")
    local cmp = require"cmp"
    local luasnip = require("luasnip")
    --local cmp_action = require('lsp-zero').cmp_action()
    --local cmp_format = require('lsp-zero').cmp_format({ details = true })
return {
      enabled = function()
	local context = require("cmp.config.context")
	if vim.api.nvim_get_mode().mode == "c" then
		return true
	else
		return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
	end
      end,
      formatting = {
        format= lspkind.cmp_format({
			    mode = "symbol",
			    maxwith = 50,
			    with_text = true,
			    menu = {
			      buffer = "[BUF]",
			      path = "[PATH]",
			      luasnip = "[SNIP]",
			      nvim_lsp = "[LSP]",
			      nvim_lau = "[API]",
			    },
			  }),
			},

    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      -- completion = require"cmp".config.window.border()
      documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<ESC>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            if luasnip.expandable() then
                luasnip.expand()
            else
                cmp.confirm({
                    select = true,
                })
            end
        else
            fallback()
        end
    end),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
      }),
				sources = cmp.config.sources({
          { name = "git" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" },
				}, {
					{ name = "buffer" },
				}),

 			cmp.setup.cmdline({ "/", "?" }, {
 				mapping = cmp.mapping.preset.cmdline(),
 				sources = {
 					{ name = "buffer" },
 				},
 			}),

 			cmp.setup.cmdline(":", {
 				mapping = cmp.mapping.preset.cmdline(),
 				sources = cmp.config.sources({
 					{ name = "path" },
 				}, {
 					{ name = "cmdline" },
 				}),
 				matching = { disallow_symbol_nonprefix_matching = false },
 			}),
 	}
      end,
}
