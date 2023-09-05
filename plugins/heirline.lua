return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require("astronvim.utils.status")
    local env = require("astronvim.utils.status.env")
    env.modes = {
      ["n"] = { "N", "normal" },
      ["no"] = { "O", "normal" },
      ["nov"] = { "O", "normal" },
      ["noV"] = { "O", "normal" },
      ["no"] = { "O", "normal" },
      ["niI"] = { "N", "normal" },
      ["niR"] = { "N", "normal" },
      ["niV"] = { "N", "normal" },
      ["i"] = { "I", "insert" },
      ["ic"] = { "I", "insert" },
      ["ix"] = { "I", "insert" },
      ["t"] = { "T", "terminal" },
      ["nt"] = { "T", "terminal" },
      ["v"] = { "V", "visual" },
      ["vs"] = { "V", "visual" },
      ["V"] = { "L", "visual" },
      ["Vs"] = { "L", "visual" },
      [""] = { "B", "visual" },
      ["s"] = { "B", "visual" },
      ["R"] = { "R", "replace" },
      ["Rc"] = { "R", "replace" },
      ["Rx"] = { "R", "replace" },
      ["Rv"] = { "V-R", "replace" },
      ["s"] = { "s", "visual" },
      ["S"] = { "S", "visual" },
      [""] = { "B", "visual" },
      ["c"] = { "C", "command" },
      ["cv"] = { "C", "command" },
      ["ce"] = { "C", "command" },
      ["r"] = { "P", "inactive" },
      ["rm"] = { "M", "inactive" },
      ["r?"] = { "F", "inactive" },
      ["!"] = { "SHELL", "inactive" },
      ["null"] = { "null", "inactive" },
    }
    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      status.component.mode {

        mode_text = {
          padding = {
            left = 1,
            right = 1,
          },

        },
      }, -- add the mode text
      status.component.git_branch(),
      status.component.file_info {
        filetype = {},
        filename = false,
        -- filename = {
        --   fallback = "Empty",
        --   padding ={ right = 1 },
        -- },
        file_modified = false,
      },
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp(),
      status.component.treesitter(),
      status.component.nav(),
      -- remove the 2nd mode indicator on the right
      status.component.mode {
        surround = {
          separator = "right",
        },
      },
    }
    -- return the final configuration table
    return opts
  end,
}
