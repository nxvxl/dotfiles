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
  use 'navarasu/onedark.nvim'
  use { 'challenger-deep-theme/vim', as = 'challenger-deep-theme' }
  use 'morhetz/gruvbox'
  use 'bluz71/vim-moonfly-colors'
  use 'folke/tokyonight.nvim'

  use 'hoob3rt/lualine.nvim'
  -- use 'akinsho/bufferline.nvim'
  use 'romgrk/barbar.nvim'

  -- icons
  use 'kyazdani42/nvim-web-devicons'
  -- use 'kyazdani42/nvim-tree.lua'

  -- syntax hightlighting
  use 'sheerun/vim-polyglot'
  use 'nvim-treesitter/nvim-treesitter'

  -- Version Control
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use 'APZelos/blamer.nvim'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  -- use 'glepnir/lspsaga.nvim'

  -- Autocompletion
  use 'hrsh7th/nvim-compe'

  use 'editorconfig/editorconfig-vim'
  use 'norcalli/nvim-colorizer.lua'
end)
