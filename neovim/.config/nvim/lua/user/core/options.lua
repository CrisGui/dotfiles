local set = vim.opt
local let = vim.g

-- Compatibility
--set.have_nerd_font = true
set.compatible = false
let.editorconfig = true

-- Indentation
set.expandtab = true
set.softtabstop = 2
set.tabstop = 2
set.shiftwidth = 2

set.wrap = false

set.linebreak = true
set.breakindent = true
set.autoindent = true
set.copyindent = true
set.smartindent = true

-- Search
set.smartcase = true
set.ignorecase = true
set.showmatch = true
set.hlsearch = false
set.incsearch = true

-- Format
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- Fold
set.foldenable = true
set.foldcolumn = "1"
set.foldlevel = 99
set.foldlevelstart = 99
--set.foldmethod = "expr"
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--set.foldexpr = vim.g["nvim_treesitter#foldexpr()"]

-- Appereance
--set.guicursor = "n-v-c-sm-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
set.colorcolumn = "100"
set.signcolumn = "yes:1"
set.termguicolors = true
set.background = "dark"
set.syntax = "enable"
set.cmdheight = 0
set.showmode = true

set.splitbelow = true
set.splitright = true

set.number = true
set.relativenumber = true
set.numberwidth = 1
set.cursorline = true

set.wildmenu = true
set.pumheight = 20

-- Behavior
set.timeoutlen = 300
set.updatetime = 50
set.hidden = true
set.history = 100
set.lazyredraw = true
set.synmaxcol = 240

set.scrolloff = 10
set.sidescrolloff = 10

set.errorbells = false

-- Mouse
set.clipboard = "unnamedplus"
set.completeopt = { "menuone", "noselect", "noinsert" }
set.mouse = "a"
set.mousemodel = "popup_setpos"
set.mousefocus = true
set.mousehide = true

-- Backup
set.undofile = true
set.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir/"
set.undolevels = 1000
set.undoreload = 1000
set.backup = true
set.writebackup = true
set.backupdir = os.getenv("HOME") .. "/.cache/nvim/backup/"
set.swapfile = true
set.autowrite = true

-- Spelling
set.spell = true
set.spelllang = "en"
let.spellfile_URL = "https://ftp.nluug.nl/vim/runtime/spell"
set.spelloptions = "camel,noplainbuffer"

-- Markdown
let.markdown_fenced_languages_enable_all = true
let.vim_markdown_fenced_languages = { "csharp=cs", "c++=cpp", "javascript=js", "typescript=ts", "markdown=md" }
set.conceallevel = 2
let.tex_conceal = "abdmgs"

-- System
set.ff = "unix"

set.isfname:append("@-@")
set.shortmess:append("flmnrwxsI") -- :help "shortmess"
set.iskeyword:append("-")

set.encoding = "utf-8"
set.fileencoding = "utf-8"
let.scriptencoding = "utf-8"

let.vimsyn_embed = "l"

set.viewoptions = { "folds", "options", "cursor", "unix", "slash" }
