return {
	event = "VeryLazy",
	main = "flash",
	"folke/flash.nvim",
	opts = {
		labels = "asdfghjklqwertyuiopzxcvbnm",
		search = {
			multi_window = true,
			forward = true,
			wrap = true,
			mode = "fuzzy",
			incremental = false,
			exclude = {
				"notify",
				"cmp_menu",
				"noice",
				"flash_prompt",
				function(win)
					-- exclude non-focusable windows
					return not vim.api.nvim_win_get_config(win).focusable
				end,
			},
			trigger = "",
			max_length = false, ---@type number|false
		},
		jump = {
			jumplist = true,
			pos = "start",
			history = true,
			register = true,
			nohlsearch = true,
			autojump = true,
			inclusive = nil,
			offset = nil,
		},
		label = {
			uppercase = true,
			exclude = "",
			current = true,
			after = true,
			before = false,
			style = "overlay",
			reuse = "lowercase",
			distance = true,
			min_pattern_length = 0,
			rainbow = {
				enabled = true,
				shade = 9,
			},
			format = function(opts)
				return { { opts.match.label, opts.hl_group } }
			end,
		},
		highlight = {
			backdrop = true,
			matches = true,
			priority = 5000,
			groups = {
				match = "FlashMatch",
				current = "FlashCurrent",
				backdrop = "FlashBackdrop",
				label = "FlashLabel",
			},
		},
		action = nil,
		pattern = "",
		continue = false,
		config = nil,
		modes = {
			search = {
				enabled = true,
				highlight = { backdrop = true },
				jump = { history = true, register = true, nohlsearch = true },
				search = {
					"forward",
				},
			},
			char = {
				enabled = true,
				config = function(opts)
					opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")
					opts.jump_labels = opts.jump_labels
						and vim.v.count == 0
						and vim.fn.reg_executing() == ""
						and vim.fn.reg_recording() == ""
					-- Show jump labels only in operator-pending mode
					-- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
				end,
				autohide = true,
				jump_labels = false,
				multi_line = true,
				label = { exclude = "hjkliardc" },
				keys = { "f", "F", "t", "T", ";", "," },
				char_actions = function(motion)
					return {
						["n"] = "next",
						["N"] = "prev",
						[motion:lower()] = "next",
						[motion:upper()] = "prev",
						-- jump2d style: same case goes next, opposite case goes prev
						-- [motion] = "next",
						-- [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
					}
				end,
				search = { wrap = false },
				highlight = { backdrop = true },
				jump = {
					register = true,
					autojump = true,
				},
			},
			treesitter = {
				labels = "abcdefghijklmnopqrstuvwxyz",
				jump = { pos = "range", autojump = true },
				search = { incremental = false },
				label = { before = true, after = true, style = "inline" },
				highlight = {
					backdrop = true,
					matches = true,
				},
			},
			treesitter_search = {
				jump = { pos = "range" },
				search = { multi_window = true, wrap = true, incremental = false },
				remote_op = { restore = true },
				label = { before = true, after = true, style = "inline" },
			},
			remote = {
				remote_op = { restore = true, motion = true },
			},
		},
		-- `require("flash").prompt()` is always available to get the prompt text
		prompt = {
			enabled = true,
			prefix = { { "⚡", "FlashPromptIcon" } },
			win_config = {
				relative = "editor",
				width = 1, -- when <=1 it's a percentage of the editor width
				height = 1,
				row = -1, -- when negative it's an offset from the bottom
				col = 0, -- when negative it's an offset from the right
				zindex = 1000,
			},
		},
		remote_op = {
			restore = true,
			motion = false,
		},
	},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "[s]earch Flash)",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "[S]earch (Flash Treesitter)",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "[r]emote (Remote Flash)",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "[R]emote (Treesitter Search)",
		},
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "(Toggle Flash Search)",
		},
	},
}
