return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  -- colorscheme = "astrodark",
  -- colorscheme = "catppuccin",
  -- colorscheme = "dracula",
  colorscheme = "doom-one",
  -- colorscheme = "onedark",
  -- colorscheme = "rose-pine-moon",
  -- colorscheme = "palenight",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
          "python",
          "lua",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- When leaving insert mode, turn off CapsLock as if its turned on in insert mode
    -- to prevent annoying behavior with vim/nvim comands
    vim.api.nvim_create_autocmd("InsertLeave", {
      callback = function()
        local uname = vim.loop.os_uname()
        if (uname.sysname:find 'Windows' and true or false) then
          -- using python script on a batch file (included)
          local dirname, _ = vim.env.MYVIMRC:match('^(.*\\)([^\\]-)$')
          local turn_caps_off_cmd = dirname .. "lua\\user\\win32\\turn_caps_off.bat"
          vim.fn.system(turn_caps_off_cmd)
          -- using capslock.exe tool
          -- This solution depends on an utility called capslock.exe, that can be downloaded from here:
          -- https://www.rjlsoftware.com/software/utility/capslock/
          -- vim.fn.system("capslock.exe off")
        elseif (uname.release:lower():find "microsoft") then
          -- This solution depends on an utility called capslock.exe, that can be downloaded from here:
          -- https://www.rjlsoftware.com/software/utility/capslock/
          vim.fn.system("capslock.exe off")
        else
          local _, _, caps_state = vim.fn.system("xset -q"):find("00: Caps Lock:%s+(%a+)")
          if caps_state == "on" then
            vim.fn.system("xdotool key Caps_Lock")
          end
        end
      end,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.py", "*.lua" },
      command = [[%s/\s\+$//e]],
    })


    -- Create text objects to select inside and arround _

    -- local chars = { '_' } --, ':', ',', ';', '|', '/', '\\', '*', '+', '%', '`', '?' }
    -- for _, char in ipairs(chars) do
    --     for _, mode in ipairs({ 'x', 'o' }) do
    --         vim.api.nvim_set_keymap(mode, "i" .. char, string.format(':<C-u>silent! normal! f%sF%slvt%s<CR>', char, char, char), { noremap = true, silent = true })
    --         vim.api.nvim_set_keymap(mode, "a" .. char, string.format(':<c-u>silent! normal! f%sf%svf%s<cr>', char, char, char), { noremap = true, silent = true })
    --     end
    -- end
    --
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
