local mapkey = require"user.core.utilities".mapkey

-- benfowler/telescope-luasnip.nvim
-- camgraff/telescope-tmux.nvim

return {
  {
    -- Telescope Plugin
    main = "fzf",
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require"telescope".load_extension"fzf"
    end,
  },
  -- {
  --   -- Telescope Plugin
  --   main = "recent-files",
  --   "mollerhoj/telescope-recent-files.nvim",
  --   config = function()
  --     require"telescope".load_extension"recent-files"
  --   end
  -- },
  {
    -- Telescope Plugin
    main = "frequency.config",
    "nvim-telescope/telescope-frecency.nvim",
    opts = {
      hide_current_buffer = true,
      db_safe_mode = false,
      auto_validate = true,
      matcher = "fuzzy",
      path_display = { "filename_first" },
      ignore_patterns = { "*/tmp/*", "term://*", "*/.git", "*/.git/*", "*/.DS_Store" },
    },
    config = function()
      require"telescope".load_extension "frecency"
    end,
  },
  {
    event = "VeryLazy",
    main = "telescope",
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    cmd = "Telescope",
    dependencies = {
      "mollerhoj/telescope-recent-files.nvim",
      "nvim-telescope/telescope-frecency.nvim",
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    init = function()
      mapkey("n", "<leader>fs", "<CMD>Telescope live_grep<CR>", { desc = "[f]ind [s]tring" })
      mapkey("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "[f]ind [f]ile" })
      -- mapkey("n", "<leader>ff", function()
      --   require"telescope".extensions["recent-files"].recent_files{}
      -- end, { desc = "[f]ind [f]ile" })
      mapkey("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "[f]ind [b]uffer" })
      mapkey("n", "<leader>fh", "<CMD>Telescope oldfiles<CR>", { desc = "[f]ind [h]istory" })
      mapkey("n", "<leader>fg", "<CMD>Telescope git_files<CR>", { desc = "[f]ind [g]it" })
      mapkey("n", "<leader>fr", "<CMD>Telescope registers<CR>", { desc = "[f]ind [r]egister" })
    end,
    opts = {
      pickers = {
        find_files = { theme = "ivy" },
        git_files = { theme = "ivy" },
        oldfiles = { theme = "ivy" },
        recent_files = { theme = "ivy" },

        registers = { theme = "cursor" },

        buffers = { theme = "dropdown" },
        live_grep = { theme = "dropdown" },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    },
  },
}
