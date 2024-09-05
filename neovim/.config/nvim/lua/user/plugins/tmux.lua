local mapkey = require("user.core.utilities").mapkey

return {
	event = "VeryLazy",
	main = "nvim-tmux-navigation",
	"alexghergh/nvim-tmux-navigation",
	opts = {
		disable_when_zoomed = true,
		keybindings = {
			left = "<C-h>",
			down = "<C-j>",
			up = "<C-k>",
			right = "<C-l>",
			--last_active = "<C-\\>",
			--next = "<C-Space>",
		},
	},
	config = function()
		require("nvim-tmux-navigation").setup({})
	end,
}
