local mapkey = require("user.core.utilities").mapkey

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- SAVE AND QUIT FILES
mapkey({ "v", "n", "i" }, "<M-w>", "<CMD>w<CR>")
mapkey({ "v", "n", "i" }, "<M-W>", "<CMD>w!<CR>")
mapkey({ "v", "n", "i" }, "<M-q>", "<CMD>q<CR>")
mapkey({ "v", "n", "i" }, "<M-Q>", "<CMD>q!<CR>")
mapkey({ "v", "n", "i" }, "<M-x>", "<CMD>x<CR>")
mapkey({ "v", "n", "i" }, "<M-X>", "<CMD>x!<CR>")

-- REGISTER
mapkey({ "n", "v" }, "x", '"_x')
mapkey({ "n", "v" }, "X", '"_x')
mapkey({ "n", "v" }, "d", '"_d')
mapkey({ "n", "v" }, "D", '"_D')
mapkey({ "n", "v" }, "<leader>y", '"+y')
mapkey({ "n", "v" }, "<leader>Y", '"+Y')
mapkey({ "n", "v" }, "<leader>p", '"+p')
mapkey({ "n", "v" }, "<leader>P", '"+P')

-- SEARCH
mapkey("n", "n", "nzzzv")
mapkey("n", "N", "Nzzzv")
mapkey("n", "#", "#zz")
mapkey("n", "*", "*zz")

-- ESCAPE TO NORMAL MODE
--mapkey("i", "jj", "<ESC>")

-- MOVEMENT
-- mapkey("n", "<C-h>", "<C-w>h")
-- mapkey("n", "<C-j>", "<C-w>j")
-- mapkey("n", "<C-k>", "<C-w>k")
-- mapkey("n", "<C-l>", "<C-w>l")
--
-- BIG STEPS
-- mapkey({ "n", "v" }, "<M-h>", "_")
-- mapkey({ "n", "v" }, "<M-j>", "<C-d>zz")
-- mapkey({ "n", "v" }, "<M-k>", "<C-u>zz")
-- mapkey({ "n", "v" }, "<M-l>", "$")

-- LAYOUT
mapkey("n", "<C-Up>", "<CMD>resize -2<CR>")
mapkey("n", "<C-Down>", "<CMD>resize +2<CR>")
mapkey("n", "<C-Right>", "<CMD>vertical resize +2<CR>")
mapkey("n", "<C-Left>", "<CMD>vertical resize -2<CR>")

-- BUFFERS
mapkey("n", "gb", "<CMD>bnext<CR>", { desc = "[g]o to the next [B]uffer" })
mapkey("n", "gB", "<CMD>bprevious<CR>", { desc = "[g]o to the previous [b]uffer" })
mapkey("n", "<leader>nb", "<CMD>new<CR>", { desc = "[n]ew [b]buffer" })
mapkey("n", "<leader>cb", "<CMD>bdelete<CR>", { desc = "[c]lose [b]uffer" })

-- PANES
--mapkey("n", "<leader>vs", "<CMD>vsplit<CR>", { desc = "[v]ertically [s]plit" })
--mapkey("n", "<leader>hs", "<CMD>split<CR>", { desc = "[h]orizontally [s]plit" })
--
--mapkey("n", "<leader>hr", "<C-w>t<C-w>K", { desc = "[h]orizontal [r]otation" })
--mapkey("n", "<leader>vr", "<C-w>t<C-w>H", { desc = "[v]ertical [r]otation" })

-- TABS
mapkey("n", "<leader>nt", "<CMD>tabnew<CR>", { desc = "[n]ew [t]ab" })
mapkey("n", "<leader>ct", "<CMD>tabclose<CR>", { desc = "[c]lose [t]ab" })

-- EDITING
mapkey("n", "J", "mzJ`z")
mapkey({ "n", "v" }, "<C-k>", "<CMD>move -2<CR>")
mapkey({ "n", "v" }, "<C-j>", "<CMD>move +1<CR>")
mapkey({ "n", "v" }, "<C-l>", "<CMD>>><CR>")
mapkey({ "n", "v" }, "<C-h>", "<CMD><<<CR>")

-- WORDS
mapkey({ "n" }, "<M-U>", "viwUe", { desc = "[Alt]erate [U]ppercase" })
mapkey({ "n" }, "<M-u>", "viwue", { desc = "[Alt]erate [u]ndercase" })
mapkey({ "n" }, "<M-t>", "b~", { desc = "[Alt]erate [t]itlecase" })

-- OTHERS
mapkey("", "U", "<CMD>redo<CR>")
mapkey("n", "<leader>x", "<CMD>!chmod +x %<CR>")
mapkey({ "n", "v" }, "<C-q><C-g>", function() -- search for <cword> on google
  vim.fn.system({
    "xdg-open",
    "https://google.com/search?q=" .. vim.fn.expand("<cword>"),
  })
end, { desc = "[C-q]uery [C-g]oogle" })
