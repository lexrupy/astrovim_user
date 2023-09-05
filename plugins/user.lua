return {
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    lazy = false
  },
  {
    "cappyzawa/trim.nvim",
    opts = {}
  },
  {
    'ThePrimeagen/vim-be-good',
    cmd = "VimBeGood"
  },
  {
    "Wansmer/treesj",
    keys = {
      {
        "<leader>m",
        "<CMD>TSJToggle<CR>",
        desc = "Toggle Treesitter Join",
      },
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false }
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    opts = {},
  },
  {
    "lexrupy/doom-one.nvim",
    -- dir = "~/projects/doom-one",
    -- dev = true
  },
  -- {
  --   "nvim-treesitter/playground",
  --   cmd = "TSPlaygroundToggle",
  --   config = function()
  --     require("notify").setup({
  --       background_colour = "#000000",
  --     })
  --   end,
  --   lazy=false,
  --   opts = {
  --     playground = {
  --       enable = true,
  --       disable = {},
  --       updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
  --       persist_queries = false, -- Whether the query persists across vim sessions
  --       keybindings = {
  --         toggle_query_editor = 'o',
  --         toggle_hl_groups = 'i',
  --         toggle_injected_languages = 't',
  --         toggle_anonymous_nodes = 'a',
  --         toggle_language_display = 'I',
  --         focus_language = 'f',
  --         unfocus_language = 'F',
  --         update = 'R',
  --         goto_node = '<cr>',
  --         show_help = '?',
  --       },
  --     }
  --   }
  -- }
  -- {
  --   "rose-pine/neovim",
  --   lazy=false,
  --   name = "rose-pine",
  --   opts = {},
  -- }
}
