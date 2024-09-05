local mapkey = require("user.core.utilities").mapkey

return {
	event = "VeryLazy",
	main = "undotree",
	"mbbill/undotree",
	key = { "<F1>" },
	cmd = { "UndotreeToggle" },
	config = function()
		mapkey("n", "<F1>", "<CMD>UndotreeToggle<CR>", { desc = "Toggle Undotree" })
	end,
}
