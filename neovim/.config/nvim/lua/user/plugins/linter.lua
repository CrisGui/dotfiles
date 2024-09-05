return {
	event = "VeryLazy",
	main = "lint",
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			bash = "shellcheck",
			c = "cpplint",
			cmake = "cmakelang",
			cpp = "cpplint",
			docker = "hadolint",
			go = "golangci-lint",
			json = "jsonlint",
			lua = "selene",
			make = "checkmake",
			markdow = "markdownlint-cli2",
			python = { "mypy", "flake8" },
			rust = "bacon",
		}

		vim.keymap.set("n", "<leader>.", function()
			local linters = require("lint").get_running()
			if #linters == 0 then
				print("󰦕")
			end
			print("󱉶 " .. table.concat(linters, ", "))
		end)
	end,
}
