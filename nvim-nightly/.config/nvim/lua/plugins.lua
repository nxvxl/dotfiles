local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = ""

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  if packer_bootstrap then
    require('packer').sync()
  end
end

vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local packer = require('packer')

packer.init {
  git = {
    clone_timeout = 300
  }
}

return packer.startup({
  function(use)
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim' }

    -- themes
    use 'navarasu/onedark.nvim'
    use { 'challenger-deep-theme/vim', as = 'challenger-deep-theme' }
    use 'gruvbox-community/gruvbox'
    use 'bluz71/vim-moonfly-colors'
    use 'folke/tokyonight.nvim'

    -- layout
    use { 'hoob3rt/lualine.nvim' }
    -- use 'akinsho/bufferline.nvim'
    use 'romgrk/barbar.nvim'

    -- icons
    use 'kyazdani42/nvim-web-devicons'
    -- use 'kyazdani42/nvim-tree.lua'

    -- syntax hightlighting
    -- use 'sheerun/vim-polyglot'
    use { 'nvim-treesitter/nvim-treesitter' }

    -- Version Control
    use { 'lewis6991/gitsigns.nvim' }
    use 'tpope/vim-fugitive'

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        { "nvim-telescope/telescope-live-grep-args.nvim" }
      }
    }

    -- LSP
    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'jose-elias-alvarez/null-ls.nvim' },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },

        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
      }
    }

    use 'editorconfig/editorconfig-vim'
    use 'norcalli/nvim-colorizer.lua'
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
