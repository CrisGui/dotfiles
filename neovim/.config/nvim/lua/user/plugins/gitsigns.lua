local mapkey = require"user.core.utilities".mapkey

return {
  event = "VeryLazy",
  main = "gitsigns",
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add          = { text = "┃" },
      change       = { text = "┃" },
      delete       = { text = "-" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
      untracked    = { text = "┆" },
    },
    signs_staged = {
      add          = { text = "┃" },
      change       = { text = "┃" },
      delete       = { text = "-" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
      untracked    = { text = "┆" },
    },
    signs_staged_enable = true,
    signcolumn = true,
    numhl      = true,
    linehl     = false,
    word_diff  = false,
    watch_gitdir = {
      follow_files = true
    },
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      -- Movement
      mapkey("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({"]c", bang = true})
        else
          gitsigns.nav_hunk("next")
        end
      end, {buffer = bufnr, desc = "Go Next (Git)"})

      mapkey("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({"[c", bang = true})
        else
          gitsigns.nav_hunk("prev")
        end
      end, {buffer = bufnr, desc = "Go Previous (Git)"})

      -- Actions
      mapkey("n", "<leader>gs", gitsigns.stage_hunk, {buffer = bufnr, desc = "[g]it [s]tage hunk"})
      mapkey("n", "<leader>gr", gitsigns.reset_hunk, {buffer = bufnr, desc = "[g]it [r]eset hunk"})
      mapkey("v", "<leader>gs", function() gitsigns.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, {buffer = bufnr, desc = "[g]it [s]tage"})
      mapkey("v", "<leader>gr", function() gitsigns.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, {buffer = bufnr, desc = "[g]it [r]eset hunk"})
      mapkey("n", "<leader>gS", gitsigns.stage_buffer, {buffer = bufnr, desc = "[g]it [S]tage buffer"})
      mapkey("n", "<leader>gu", gitsigns.undo_stage_hunk, {buffer = bufnr, desc = "[g]it [u]ndo stage hunk"})
      mapkey("n", "<leader>gR", gitsigns.reset_buffer, {buffer = bufnr, desc = "[g]it [R]eset buffer"})
      mapkey("n", "<leader>gp", gitsigns.preview_hunk, {buffer = bufnr, desc = "[g]it [p]review hunk"})
      mapkey("n", "<leader>gb", function() gitsigns.blame_line{full=true} end, {buffer = bufnr, desc = "[g]it [b]lame"})
      mapkey("n", "<leader>gtb", gitsigns.toggle_current_line_blame, {buffer = bufnr, desc = "[g]it [t]oggle [b]lame"})
      mapkey("n", "<leader>gd", gitsigns.diffthis, {buffer = bufnr, desc = "[g]it [d]iff"})
      mapkey("n", "<leader>gD", function() gitsigns.diffthis("~") end, {buffer = bufnr, desc = "[g]it [D]iff this"})
      mapkey("n", "<leader>gtd", gitsigns.toggle_deleted, {buffer = bufnr, desc = "[g]it [t]oggle [d]elete"})

      -- Text object
      --mapkey({"o", "x"}, "ih", "<CMD>Gitsigns select_hunk<CR>")
    end,
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },
    current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
      border = "single",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1
    },
  }
}
