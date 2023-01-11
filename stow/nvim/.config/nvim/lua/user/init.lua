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
	},

	-- Set colorscheme to use
	colorscheme = "material",

	-- Add highlight groups in any theme
	highlights = {},

	-- set vim options here (vim.<first_key>.<second_key> =  value)
	options = {
		opt = {
			-- set to true or false etc.
			relativenumber = true, -- sets vim.opt.relativenumber
			number = true, -- sets vim.opt.number
			-- spell = true, -- sets vim.opt.spell
			signcolumn = "auto", -- sets vim.opt.signcolumn to auto
			wrap = false, -- sets vim.opt.wrap

			---# Custom #---

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
			diagnostics_enabled = true, -- enable diagnostics at start
			status_diagnostics_enabled = true, -- enable diagnostics in statusline
			icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
			ui_notifications_enabled = true, -- disable notifications when toggling UI elements
			heirline_bufferline = false, -- enable new heirline based bufferline (requires :PackerSync after changing)

			---# Custom #---

			-- themes
			material_style = "deep ocean",
			tokyonight_style = "night",

			-- neovide
			neovide_refresh_rate = 200,

			-- copilot
			copilot_no_tab_map = true,
			copilot_assume_mapped = true,

			-- highlightedyank
			highlightedyank_highlight_duration = 200,
		},
	},

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
		-- Modify the color palette for the default theme
		colors = {
			fg = "#abb2bf",
			bg = "#1e222a",
		},
		highlights = function(hl) -- or a function that returns a new table of colors to set
			local C = require("default_theme.colors")

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
			cmp = true,
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
			treesitter = true,
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
		servers = {},
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
				-- "sumneko_lua",
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
			},
		},

		-- Add overrides for LSP server settings, the keys are the name of the server
		["server-settings"] = {},
	},

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
			["<leader>bt"] = { "<CMD>BufferLineSortByTabs<CR>", desc = "Sort by tabs" },
		},
		i = {
			["<A-j>"] = { "<Esc>:m .+1<CR>==gi", desc = "Move line up" },
			["<A-k>"] = { "<Esc>:m .-2<CR>==gi", desc = "Move line down" },
		},
		v = {
			["<S-j>"] = { "j" },
			["<S-k>"] = { "k" },
			["<A-j>"] = { ":m '>+1<CR>gv=gv", desc = "Move line up" },
			["<A-k>"] = { ":m '<-2<CR>gv=gv", desc = "Move line down" },
		},
		t = {
			-- setting a mapping to false will disable it
			-- ["<esc>"] = false,
		},
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

			{ "tpope/vim-surround" },
			{ "ggandor/lightspeed.nvim" },
			{
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
								alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
								-- signs = false, -- configure signs for some keywords individually
							},
							TODO = { icon = " ", color = "warning", alt = {} },
							HACK = { icon = " ", color = "warning" },
							WARN = {
								icon = " ",
								color = "warning",
								alt = { "WARNING", "XXX" },
							},
							PERF = {
								icon = " ",
								alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
							},
							NOTE = {
								icon = " ",
								color = "info",
								alt = { "INFO" },
							},
							TEST = { icon = "ﭧ ", color = "hint", alt = {} },
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
							exclude = {}, -- list of file types to exclude highlighting
						},
						-- list of named colors where we try to extract the guifg from the
						-- list of hilight groups or use the hex color if hl not found as a fallback
						colors = {
							error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
							warning = { "#FBBF24" },
							info = { "#2563EB" },
							hint = { "#10B981" },
							default = { "Identifier", "#7C3AED" },
						},
						search = {
							command = "rg",
							args = {
								"--color=never",
								"--no-heading",
								"--with-filename",
								"--line-number",
								"--column",
							},
							-- regex that will be used to match keywords.
							-- don't replace the (KEYWORDS) placeholder
							pattern = [[\b(KEYWORDS)\s*:]], -- ripgrep regex
							-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
						},
					})
				end,
			},
		},
		-- All other entries override the require("<key>").setup({...}) call for default plugins
		["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
			-- config.sources = {}
			return config -- return final config table
		end,
		treesitter = { -- overrides `require("treesitter").setup(...)`
			ensure_installed = "all",
		},
		-- use mason-lspconfig to configure LSP installations
		["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
			ensure_installed = {},
		},
		-- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
		["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
			ensure_installed = {
				"rust-analyzer",
				"black",
				"prettier",
				"stylua",
			},
		},
		["mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
			-- ensure_installed = { "python" },
		},
	},

	-- LuaSnip Options
	luasnip = {
		-- Extend filetypes
		filetype_extend = {
			-- javascript = { "javascriptreact" },
		},
		-- Configure luasnip loaders (vscode, lua, and/or snipmate)
		vscode = {
			-- Add paths for including more VS Code style snippets in luasnip
			paths = {},
		},
	},

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

	polish = function()
		-- Set key binding
		vim.cmd("imap <silent><script><expr> <C-L> copilot#Accept()")
		-- Set autocommands
		vim.api.nvim_create_augroup("packer_conf", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			desc = "Sync packer after modifying plugins.lua",
			group = "packer_conf",
			pattern = "plugins.lua",
			command = "source <afile> | PackerSync",
		})
		vim.api.nvim_create_autocmd("TextYankPost", {
			desc = "Highlight on yank",
			pattern = "*",
			command = "lua vim.highlight.on_yank{higroup='IncSearch', timeout=200}",
		})
	end,
}

return config
