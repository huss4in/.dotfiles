--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- A split up user configuration example can be found at: https://github.com/AstroNvim/split_user_example

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
    auto_quit = true, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme to use
  colorscheme = "material",

  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },

  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap

      ---# Custom #---
      -- nvim
      confirm = true, -- Confirm before exit
      clipboard = "", -- Disable default clipboard

      -- gui
      guifont = "FiraCode Nerd Font:h11",
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      autoformat_enabled = false, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
      icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements

      ---# Custom #---
      -- themes
      material_style = "deep ocean",
      tokyonight_style = "night",

      -- copilot
      copilot_no_tab_map = true,
      copilot_assume_mapped = true,

      -- neovide
      neovide_refresh_rate = 165,
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

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    underline = true,
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
        ["gff"] = { "<cmd>Format<cr>", desc = "Format" },
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the LSP setup handler function based on server name
    -- setup_handlers = {
    --   -- first function changes the default setup handler
    --   function(server, opts) require("lspconfig")[server].setup(opts) end,
    --   -- keys for a specific server name will be used for that LSP
    --   lua_ls = function(server, opts)
    --     -- custom lua_ls setup handler
    --     require("lspconfig")["lua_ls"].setup(opts)
    --   end,
    -- },

    -- Add overrides for LSP server settings, the keys are the name of the server
    config = {
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
      lua = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      },
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

      -- tables with the `name` key will be registered with which-key if it's installed
      -- this is useful for naming menus
      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

      ["<A-j>"] = { ":m .+1<cr>==", desc = "Move line up" },
      ["<A-k>"] = { ":m .-2<cr>==", desc = "Move line down" },

      ["<leader>y"] = { '"+y', desc = "Yank to clipboard" },
      ["<leader>D"] = { '"_d', desc = "Delete to void" },

      ["<leader>c"] = { name = "Close", desc = "❌ Close" },
      ["<leader>cc"] = {
        function() require("astronvim.utils.buffer").close() end,
        desc = "Buffer",
      },
      ["<leader>ca"] = {
        function() require("astronvim.utils.buffer").close_all() end,
        desc = "All buffers",
      },
      ["<leader>co"] = {
        function() require("astronvim.utils.buffer").close_all(true) end,
        desc = "Other buffers",
      },
      ["<leader>cb"] = {
        function()
          require("astronvim.utils.status").heirline.buffer_picker(
            function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
          )
        end,
        desc = "Pick buffer",
      },

      ['<leader>f"'] = {
        ":Telescope registers<cr>",
        desc = "Find registers",
      },

      ["<leader>/"] = false,
      ["<leader>C"] = false,
      ["<leader>bc"] = false,
      ["<leader>bC"] = false,
      ["<leader>bd"] = false,
    },
    i = {
      ["<A-k>"] = { "<esc>:m .-2<cr>==gi", desc = "Move line down" },
      ["<A-j>"] = { "<esc>:m .+1<cr>==gi", desc = "Move line up" },
    },
    v = {
      ["<leader>y"] = { '"+y', desc = "Yank to clipboard" },
      ["D"] = { '"_d', desc = "Delete to void" },

      [">"] = { ">gv" },
      ["<"] = { "<gv" },

      ["<S-j>"] = { "j" },
      ["<S-k>"] = { "k" },
      ["<A-j>"] = { ":m '>+1<cr><esc>gv=gv", desc = "Move line up" },
      ["<A-k>"] = { ":m '<-2<cr><esc>gv=gv", desc = "Move line down" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml",
          "gzip",
          "matchit",
          "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
          "matchparen",
        },
      },
    },
  },

  -- Configure plugins
  plugins = {

    { "marko-cerovac/material.nvim" }, -- Material Theme
    { "folke/tokyonight.nvim" }, --Tokyonight Theme

    { "sitiom/nvim-numbertoggle", lazy = false }, -- Toggle relative numbers

    { "tpope/vim-surround", lazy = false }, -- Surround
    { "psliwka/vim-smoothie", lazy = false }, -- Smooth scroll
    {
      "m-demare/hlargs.nvim",
      lazy = false,
      requires = { "nvim-treesitter/nvim-treesitter" },
      config = function() require("hlargs").setup() end,
    }, -- Smooth scroll
    -- { "vim-scripts/argtextobj.vim", lazy = false }, -- argtextobj

    -- Substitute
    {
      "gbprod/substitute.nvim",
      lazy = false,
      config = function()
        require("substitute").setup {}

        local x = { noremap = true }

        -- Swap
        vim.keymap.set("n", "Xs", require("substitute").operator, x)
        vim.keymap.set("n", "Xss", require("substitute").line, x)
        vim.keymap.set("n", "XS", require("substitute").eol, x)
        vim.keymap.set("x", "Xs", require("substitute").visual, x)

        -- Exchange
        vim.keymap.set("n", "Xc", require("substitute.exchange").operator, x)
        vim.keymap.set("n", "Xcc", require("substitute.exchange").line, x)
        vim.keymap.set("x", "Xc", require("substitute.exchange").visual, x)
        -- vim.keymap.set("n", "xcx", require("substitute.exchange").cancel, x)
        -- vim.keymap.set("x", "xcx", require("substitute.exchange").cancel, x)
      end,
    },

    { "ggandor/lightspeed.nvim", lazy = false }, -- Lightspeed

    { "mg979/vim-visual-multi", lazy = false }, -- Multi-Cursor

    { "github/copilot.vim", lazy = false }, -- GitHub Copilot

    { "rust-lang/rust.vim" }, -- Rust

    -- You can disable default plugins as follows:
    -- { "max397574/better-escape.nvim", enabled = false },
    --
    -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
    -- {
    --   "L3MON4D3/LuaSnip",
    --   config = function(plugin, opts)
    --     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
    --     -- add more custom luasnip configuration such as filetype extend or custom snippets
    --     local luasnip = require "luasnip"
    --     luasnip.filetype_extend("javascript", { "javascriptreact" })
    --   end,
    -- },
    -- {
    --   "windwp/nvim-autopairs",
    --   config = function(plugin, opts)
    --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
    --     -- add more custom autopairs configuration such as custom rules
    --     local npairs = require "nvim-autopairs"
    --     local Rule = require "nvim-autopairs.rule"
    --     local cond = require "nvim-autopairs.conds"
    --     npairs.add_rules(
    --       {
    --         Rule("$", "$", { "tex", "latex" })
    --           -- don't add a pair if the next character is %
    --           :with_pair(cond.not_after_regex "%%")
    --           -- don't add a pair if  the previous character is xxx
    --           :with_pair(
    --             cond.not_before_regex("xxx", 3)
    --           )
    --           -- don't move right when repeat character
    --           :with_move(cond.none())
    --           -- don't delete if the next character is xx
    --           :with_del(cond.not_after_regex "xx")
    --           -- disable adding a newline when you press <cr>
    --           :with_cr(cond.none()),
    --       },
    --       -- disable for .vim files, but it work for another filetypes
    --       Rule("a", "a", "-vim")
    --     )
    --   end,
    -- },
    -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
    -- {
    --   "folke/which-key.nvim",
    --   config = function(plugin, opts)
    --     require "plugins.configs.which-key"(plugin, opts)
    --     -- Add bindings which show up as group name
    --     local wk = require "which-key"
    --     wk.register({
    --       b = { name = "Buffer" },
    --     }, { mode = "n", prefix = "<leader>" })
    --   end,
    -- },
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
    -- Plugin entries can also be used to override the default options for plugins as well
    {
      "goolord/alpha-nvim",
      opts = function(_, opts)
        -- customize the dashboard header
        opts.section.header.val = {
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
        }
        return opts
      end,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function(_, config)
        -- config variable is the default configuration table for the setup function call
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
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        -- ensure_installed = "all",
      },
    },
    -- use mason-lspconfig to configure LSP installations
    {
      "williamboman/mason-lspconfig.nvim",
      -- overrides `require("mason-lspconfig").setup(...)`
      opts = {
        -- ensure_installed = { "lua_ls" },
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    {
      "jay-babu/mason-null-ls.nvim",
      -- overrides `require("mason-null-ls").setup(...)`
      opts = {
        -- ensure_installed = { "prettier", "stylua" },
      },
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      -- overrides `require("mason-nvim-dap").setup(...)`
      opts = {
        -- ensure_installed = { "python" },
      },
    },
  },

  -- Customize Heirline options
  heirline = {
    -- Customize different separators between sections
    separators = {
      breadcrumbs = " -> ",
      tab = { "", "" },
    },
    -- Customize colors for each element each element has a `_fg` and a `_bg`
    --colors = function(colors)
    --  colors.git_branch_fg = require("astronvim.utils").get_hlgroup "Conditional"
    --  return colors
    --end,
    -- Customize attributes of highlighting in Heirline components
    attributes = {
      -- styling choices for each heirline element, check possible attributes with `:h attr-list`
      git_branch = { bold = true }, -- bold the git branch statusline component
    },

    -- Customize if icons should be highlighted
    icon_highlights = {
      breadcrumbs = true, -- LSP symbols in the breadcrumbs
      file_icon = {
        winbar = true, -- Filetype icon in the winbar inactive windows
        statusline = true, -- Filetype icon in the statusline
        tabline = true, -- Filetype icon in the tabline
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
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

    -- Set key binding
    vim.cmd "imap <silent><script><expr> <C-L> copilot#Accept()"
  end,
}

return config
