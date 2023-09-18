-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bN"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bn"] = { "<cmd>enew<cr>", desc = "New buffer" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key
    -- if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["ç"] = {":", desc = "Enter Command Mode"},
    ["Ç"] = {":", desc = "Enter Command Mode"},
    ["<Tab>"] = { ":bn<CR>", desc = "Next Buffer"},
    ["<S-Tab>"] = { ":bp<CR>", desc = "Previous Buffer"},
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<c-w>,"] = {"<c-w>t<c-w>H", desc = "Change Split to Vertical"},
    ["<c-w>."] = {"<c-w>t<c-w>K", desc = "Change Split to Horizontal"},
    ["<c-u>"] = {"<c-u>zz", desc = "Move Half Page UP"},
    ["<c-d>"] = {"<c-d>zz", desc = "Move Half Page DOWN"},
    ["<c-g>"] = {"1<c-g>", desc = "Display Current File Path"},
    -- Paste tricks
    [",p"] = {'"0p', desc="Paste last yanked text after cursor"},
    [",P"] = {'"0P', desc="Paste last yanked text before cursor"},
  },
  i = {
    -- quick save
    --["<C-s>"] = { "<esc>:w!<cr>a", desc = "Save File" },  -- change description but the same command
    -- ["<C-s>"] = { "<c-o>:w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<C-o>"] = { "<C-\\><C-o>"}
  },
  v = {
    ["Ç"] = {":", desc = "Enter Command Mode"},
    ["ç"] = {":", desc = "Enter Command Mode"},
    -- Paste tricks
    [",p"] = {'"0p', desc="Paste last yanked text after cursor"},
    [",P"] = {'"0P', desc="Paste last yanked text before cursor"},
  },
  c = {
    ["Q"] = {"q!", desc = "Force Quit without save"}
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
