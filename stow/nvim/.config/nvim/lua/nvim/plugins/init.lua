local fn = vim.fn
local packer_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

-- Automatically install packer
if fn.empty(fn.glob(packer_path)) > 0 then
  print("  Installing packer.nvim...")
  PACKER_BOOTSTRAP = fn.system {
    "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path,
  }
  vim.cmd "packadd packer.nvim"
  return print("  Please restart NeoVim, and run nvim +PackerSync")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/lua/nvim/plugins/init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local ok, module = pcall(require, "packer")
if not ok then
  return print "  Couldn't load packer"
else
  packer = module
end

-- Let packer use a popup window
packer.init {
  display = {
    open_fn = function() return require("packer.util").float { border = "rounded" } end,
  },
}

packer.startup(function(use)
  -- Packer plugins
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- Theme
  use 'marko-cerovac/material.nvim'
  use 'folke/tokyonight.nvim'
  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  -- Hybrid relative numbers
  use 'jeffkreeftmeijer/vim-numbertoggle'
  -- Auto pairs
  use 'jiangmiao/auto-pairs'
  -- Surround
  use "tpope/vim-surround"
  -- Lightspeed
  use "ggandor/lightspeed.nvim"
  -- Commentary
  use "tpope/vim-commentary"
  -- Highlighted Yank
  use "machakann/vim-highlightedyank"

  -- GitHub Copilot
  use 'github/copilot.vim'

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip"
  use "f3fora/cmp-spell"

  -- Snippets
  use "L3MON4D3/LuaSnip"
  -- ultisnips.
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  -- For snippy.
  use 'dcampos/nvim-snippy'
  use 'dcampos/cmp-snippy'

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  -- Treesitter
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = ':TSUpdate'
  -- }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

require("nvim.plugins.colorscheme")
require("nvim.plugins.lualine")
require("nvim.plugins.highlightedyank")
require("nvim.plugins.lightspeed")
require("nvim.plugins.telescope")
require("nvim.plugins.copilot")
require("nvim.plugins.cmp")
-- require("nvim.plugins.treesitter")
