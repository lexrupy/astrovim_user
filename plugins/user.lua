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
}
