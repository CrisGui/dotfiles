local fn = vim.fn

local function is_executable(name)
	if fn.executable(name) > 0 then
		return true
	end
	return false
end

--- check whether a feature exists in Nvim
--- @feat: string
---   the feature name, like `nvim-0.7` or `unix`.
--- return: bool
local function has(feat)
	if fn.has(feat) == 1 then
		return true
	end
	return false
end

--- Create a dir if it does not exist
local function may_create_dir(dir)
	if fn.isdirectory(dir) == 0 then
		fn.mkdir(dir, "p")
	end
end

--- Generate random integers in the range [Low, High], inclusive,
--- adapted from https://stackoverflow.com/a/12739441/6064933
--- @low: the lower value for this range
--- @high: the upper value for this range
local function rand_int(low, high)
	-- Use lua to generate random int, see also: https://stackoverflow.com/a/20157671/6064933
	math.randomseed(os.time())
	return math.random(low, high)
end

--- Select a random element from a sequence/list.
--- @seq: the sequence to choose an element
local function rand_element(seq)
	local idx = M.rand_int(1, #seq)
	return seq[idx]
end

local icons = {
	kind = {
		Array = " ",
		Boolean = " ",
		Class = " ",
		Color = " ",
		Constant = " ",
		Constructor = " ",
		Enum = " ",
		EnumMember = " ",
		Event = " ",
		Field = " ",
		File = " ",
		Folder = "󰉋 ",
		Function = " ",
		Interface = " ",
		Key = " ",
		Keyword = " ",
		Method = " ",
		Module = " ",
		Module = " ",
		Namespace = " ",
		Null = "󰟢 ",
		Number = " ",
		Object = " ",
		Operator = " ",
		Package = " ",
		Property = " ",
		Reference = " ",
		Snippet = " ",
		String = " ",
		Struct = " ",
		Text = " ",
		TypeParameter = " ",
		Unit = " ",
		Value = " ",
		Variable = " ",
	},
	git = {
		LineAdded = " ",
		LineModified = " ",
		LineRemoved = " ",
		FileDeleted = " ",
		FileIgnored = "◌",
		FileRenamed = " ",
		FileStaged = "S",
		FileUnmerged = "",
		FileUnstaged = "",
		FileUntracked = "U",
		Diff = " ",
		Repo = " ",
		Octoface = " ",
		Copilot = " ",
		Branch = "",
	},
	ui = {
		ArrowCircleDown = "",
		ArrowCircleLeft = "",
		ArrowCircleRight = "",
		ArrowCircleUp = "",
		BoldArrowDown = "",
		BoldArrowLeft = "",
		BoldArrowRight = "",
		BoldArrowUp = "",
		BoldClose = "",
		BoldDividerLeft = "",
		BoldDividerRight = "",
		BoldLineLeft = "▎",
		BoldLineMiddle = "┃",
		BoldLineDashedMiddle = "┋",
		BookMark = "",
		BoxChecked = " ",
		Bug = " ",
		Stacks = "",
		Scopes = "",
		Watches = "󰂥",
		DebugConsole = " ",
		Calendar = " ",
		Check = "",
		ChevronRight = "",
		ChevronShortDown = "",
		ChevronShortLeft = "",
		ChevronShortRight = "",
		ChevronShortUp = "",
		Circle = " ",
		Close = "󰅖",
		CloudDownload = " ",
		Code = "",
		Comment = "",
		Dashboard = "",
		DividerLeft = "",
		DividerRight = "",
		DoubleChevronRight = "»",
		Ellipsis = "",
		EmptyFolder = " ",
		EmptyFolderOpen = " ",
		File = " ",
		FileSymlink = "",
		Files = " ",
		FindFile = "󰈞",
		FindText = "󰊄",
		Fire = "",
		Folder = "󰉋 ",
		FolderOpen = " ",
		FolderSymlink = " ",
		Forward = " ",
		Gear = " ",
		History = " ",
		Lightbulb = " ",
		LineLeft = "▏",
		LineMiddle = "│",
		List = " ",
		Lock = " ",
		NewFile = " ",
		Note = " ",
		Package = " ",
		Pencil = "󰏫 ",
		Plus = " ",
		Project = " ",
		Search = " ",
		SignIn = " ",
		SignOut = " ",
		Tab = "󰌒 ",
		Table = " ",
		Target = "󰀘 ",
		Telescope = " ",
		Text = " ",
		Tree = "",
		Triangle = "󰐊",
		TriangleShortArrowDown = "",
		TriangleShortArrowLeft = "",
		TriangleShortArrowRight = "",
		TriangleShortArrowUp = "",
	},
	diagnostics = {
		BoldError = "",
		Error = "",
		BoldWarning = "",
		Warning = "",
		BoldInformation = "",
		Information = "",
		BoldQuestion = "",
		Question = "",
		BoldHint = "",
		Hint = "󰌶",
		Debug = "",
		Trace = "✎",
	},
	misc = {
		Robot = "󰚩 ",
		Squirrel = " ",
		Tag = " ",
		Watch = "",
		Smiley = " ",
		Package = " ",
		CircuitBoard = " ",
	},
}

local function mapkey(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

local function it_contains(item, array)
	for _, v in ipairs(array) do
		if v == item then
			return true
		end
	end
end

return {
	has = has,
	isExecutable = is_executable,
	mapkey = mapkey,
	icons = icons,
	randInt = rand_int,
	randElement = rand_element,
	mayCreateDir = may_create_dir,
	itContains = it_contains,
}
