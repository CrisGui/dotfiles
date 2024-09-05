local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local f = vim.fn

local mayCreateDir = require("user.core.utilities").mayCreateDir

-- Enter insert mode when switching to terminal
autocmd("TermOpen", {
	command = "setlocal listchars= nonumber norelativenumber nocursorline",
})
autocmd("TermOpen", {
	pattern = "",
	command = "startinsert",
})

-- Close terminal buffer on process exit
autocmd("BufLeave", {
	pattern = "term://*",
	command = "stopinsert",
})

-- Display a message when the current file is not in utf-8 format.
autocmd({ "BufRead" }, {
	pattern = "*",
	group = augroup("non_utf8_file", { clear = true }),
	callback = function()
		if vim.bo.fileencoding ~= "utf-8" then
			vim.notify("File not in UTF-8 format!", vim.log.levels.WARN, { title = "nvim-config" })
		end
	end,
})

-- Auto-create dir when saving a file, in case some intermediate directory does not exist
autocmd({ "BufWritePre" }, {
	pattern = "*",
	group = augroup("auto_create_dir", { clear = true }),
	callback = function(ctx)
		local dir = f.fnamemodify(ctx.file, ":p:h")
		mayCreateDir(dir)
	end,
})

-- Automatically reload the file if it is changed outside of Nvim, see https://unix.stackexchange.com/a/383044/221410.
augroup("auto_read", { clear = true })

autocmd({ "FileChangedShellPost" }, {
	pattern = "*",
	group = "auto_read",
	callback = function()
		vim.notify("File changed on disk. Buffer reloaded!", vim.log.levels.WARN, { title = "nvim-config" })
	end,
})

autocmd({ "FocusGained", "CursorHold" }, {
	pattern = "*",
	group = "auto_read",
	callback = function()
		if f.getcmdwintype() == "" then
			vim.cmd("checktime")
		end
	end,
})

-- -- Autocmd to trigger linting
-- autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })
