--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme to use
  colorscheme = "material",

  -- -- Add highlight groups in any theme
  -- highlights = {
  --   -- init = { -- this table overrides highlights in all themes
  --   --   Normal = { bg = "#000000" },
  --   -- }
  --   -- duskfox = { -- a table of overrides/changes to the duskfox theme
  --   --   Normal = { bg = "#000000" },
  --   -- },
  -- },
  --
  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      -- spell = true, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
      confirm = true,
      clipboard = "",

      -- gui
      guifont = "FiraCode Nerd Font:h10",
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline

      -- themes
      material_style = "deep ocean",
      tokyonight_style = "night",

      -- neovide
      neovide_refresh_rate = 240,

      copilot_no_tab_map = true,
      copilot_assume_mapped = true,

      highlightedyank_highlight_duration = 200,
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = {
    " █████  ███████ ████████ ██████   ██████",
    "██   ██ ██         ██    ██   ██ ██    ██",
    "███████ ███████    ██    ██████  ██    ██",
    "██   ██      ██    ██    ██   ██ ██    ██",
    "██   ██ ███████    ██    ██   ██  ██████",
    " ",
    "    ███    ██ ██    ██ ██ ███    ███",
    "    ████   ██ ██    ██ ██ ████  ████",
    "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
    "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
    "    ██   ████   ████   ██ ██      ██",
  },

  -- Default theme configuration
  default_theme = {
    -- -- Modify the color palette for the default theme
    colors = {
      fg = "#abb2bf",
      bg = "#1e222a",
    },
    highlights = function(hl) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      hl.Normal = { fg = C.fg, bg = C.bg }

      -- New approach instead of diagnostic_style
      hl.DiagnosticError.italic = true
      hl.DiagnosticHint.italic = true
      hl.DiagnosticInfo.italic = true
      hl.DiagnosticWarn.italic = true

      return hl
    end,
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      format_on_save = false, -- enable or disable auto formatting on save
      disabled = { -- disable formatting capabilities for the listed clients
        -- "sumneko_lua",
      },
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<A-j>"] = { ":m .+1<CR>==", desc = "Move line up" },
      ["<A-k>"] = { ":m .-2<CR>==", desc = "Move line down" },

      ["<A-l>"] = { "<CMD>BufferLineMoveNext<CR>", desc = "Move window next" },
      ["<A-h>"] = { "<CMD>BufferLineMovePrev<CR>", desc = "Move window previos" },

      ["<leader>bb"] = { "<CMD>BufferLinePick<CR>", desc = "Pick window" },

      ["<leader>c"] = false,
      ["<leader>cc"] = { "<CMD>bdelete<CR>", desc = "Window (buffer)" },
      ["<leader>cb"] = { "<CMD>BufferLinePickClose<CR>", desc = "Pick (Bufferline)" },
      ["<leader>cH"] = { "<CMD>BufferLineCloseLeft<CR>", desc = "Left" },
      ["<leader>cL"] = { "<CMD>BufferLineCloseRight<CR>", desc = "Right" },
      ["<leader>bt"] = { "<CMD>BufferLineSortByTabs<CR>", desc = "Sort by tabs" }
    },
    i = {
      ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", desc = "Move line up" },
      ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", desc = "Move line down" }
    },
    v = {
      ["<S-j>"] = { "j" },
      ["<S-k>"] = { "k" },
      ["<A-j>"] = { ":m '>+1<CR>gv=gv", desc = "Move line up" },
      ["<A-k>"] = { ":m '<-2<CR>gv=gv", desc = "Move line down" }
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    }
  },

  -- Configure plugins
  plugins = {
    init = {

      -- Theme
      { "marko-cerovac/material.nvim" }, -- Material
      { "folke/tokyonight.nvim" }, --Tokyonight


      { "jeffkreeftmeijer/vim-numbertoggle" }, -- Toggle relative numbers

      { "mg979/vim-visual-multi" }, -- Multi-Cursor
      { "github/copilot.vim" }, -- GitHub Copilot

      { "rust-lang/rust.vim" }, -- Rust

      { "psliwka/vim-smoothie" }, -- Smooth scroll

      { "tpope/vim-surround" }, { "ggandor/lightspeed.nvim" }, {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
          require("todo-comments").setup({
            signs = true, -- show icons in the signs column
            sign_priority = 8, -- sign priority
            -- keywords recognized as todo comments
            keywords = {
              FIX = {
                icon = " ", -- icon used for the sign, and in search results
                color = "error", -- can be a hex color, or a named color (see below)
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } -- a set of other keywords that all map to this FIX keywords
                -- signs = false, -- configure signs for some keywords individually
              },
              TODO = { icon = " ", color = "warning", alt = {} },
              HACK = { icon = " ", color = "warning" },
              WARN = {
                icon = " ",
                color = "warning",
                alt = { "WARNING", "XXX" }
              },
              PERF = {
                icon = " ",
                alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" }
              },
              NOTE = {
                icon = " ",
                color = "info",
                alt = { "INFO" }
              },
              TEST = { icon = "ﭧ ", color = "hint", alt = {} }
            },
            merge_keywords = true, -- when true, custom keywords will be merged with the defaults
            -- highlighting of the line containing the todo comment
            -- * before: highlights before the keyword (typically comment characters)
            -- * keyword: highlights of the keyword
            -- * after: highlights after the keyword (todo text)
            highlight = {
              before = "", -- "fg" or "bg" or empty
              keyword = "bg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
              after = "fg", -- "fg" or "bg" or empty
              pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
              comments_only = true, -- uses treesitter to match keywords in comments only
              max_line_len = 400, -- ignore lines longer than this
              exclude = {} -- list of file types to exclude highlighting
            },
            -- list of named colors where we try to extract the guifg from the
            -- list of hilight groups or use the hex color if hl not found as a fallback
            colors = {
              error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
              warning = { "#FBBF24" },
              info = { "#2563EB" },
              hint = { "#10B981" },
              default = { "Identifier", "#7C3AED" }
            },
            search = {
              command = "rg",
              args = {
                "--color=never", "--no-heading",
                "--with-filename", "--line-number", "--column"
              },
              -- regex that will be used to match keywords.
              -- don't replace the (KEYWORDS) placeholder
              pattern = [[\b(KEYWORDS)\s*:]] -- ripgrep regex
              -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
            }
          })
        end
      },

      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- Add plugins, the packer syntax without the "use"
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },

      -- We also support a key value style plugin definition similar to NvChad:
      -- ["ray-x/lsp_signature.nvim"] = {
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      -- config variable is the default configuration table for the setup functino call
      -- local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.prettier,
      }
      return config -- return final config table
    end,
    treesitter = { -- overrides `require("treesitter").setup(...)`
      -- ensure_installed = { "lua" },
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      -- ensure_installed = { "sumneko_lua" },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
      -- ensure_installed = { "prettier", "stylua" },
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      -- javascript = { "javascriptreact" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set key binding
    vim.cmd("imap <silent><script><expr> <C-L> copilot#Accept()")
    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync"
    })
    vim.api.nvim_create_autocmd("TextYankPost", {
      desc = "Highlight on yank",
      pattern = "*",
      command = "lua vim.highlight.on_yank{higroup='IncSearch', timeout=200}"
    })

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

return config