return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "tpope/vim-fugitive",
    lazy = false
  },
  {
    "cappyzawa/trim.nvim",
    opts = {}
  },
  {
    "direnv/direnv.vim",
  },
  {
    'ThePrimeagen/vim-be-good',
    cmd = "VimBeGood"
  },
}
