vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

packer.init {
  git = {
    clone_timeout = 300
  }
}

return packer.startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- themes
  use 'bluz71/vim-moonfly-colors'
  use 'kaicataldo/material.vim'
  use { 'dracula/vim', as = 'dracula' }
  use 'lewis6991/moonlight.vim'
  use 'navarasu/onedark.nvim'
  use 'sickill/vim-monokai'
  use 'novasenco/nokto'
  use 'lucasprag/simpleblack'
  use { 'challenger-deep-theme/vim', as = 'challenger-deep-theme' }
  use 'ayu-theme/ayu-vim'
  use 'shaunsingh/nord.nvim'

  -- Status Line
  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'

  use 'hoob3rt/lualine.nvim'
  -- use 'akinsho/bufferline.nvim'
  use 'romgrk/barbar.nvim'

  -- icons
  use 'kyazdani42/nvim-web-devicons'
  -- use 'kyazdani42/nvim-tree.lua'

  -- syntax hightlighting
  use 'sheerun/vim-polyglot'
  -- use 'nvim-treesitter/nvim-treesitter'

  -- Version Control
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'APZelos/blamer.nvim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  -- use 'glepnir/lspsaga.nvim'

  -- Autocompletion
  use 'hrsh7th/nvim-compe'
  -- use 'nvim-lua/completion-nvim'

  use 'editorconfig/editorconfig-vim'

  -- use 'vimwiki/vimwiki'

  use 'norcalli/nvim-colorizer.lua'
end)
