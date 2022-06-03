vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]])

function config_path(name)
  return string.format('require("plugins/%s")', name)
end

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require('packer')

packer.init {
  git = {
    clone_timeout = 300
  }
}

return packer.startup({
  function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- themes
    use 'navarasu/onedark.nvim'
    use { 'challenger-deep-theme/vim', as = 'challenger-deep-theme' }
    use 'gruvbox-community/gruvbox'
    use 'bluz71/vim-moonfly-colors'
    use 'folke/tokyonight.nvim'

    -- layout
    use { 'hoob3rt/lualine.nvim', config = config_path('lualine') }
    -- use 'akinsho/bufferline.nvim'
    use 'romgrk/barbar.nvim'

    -- icons
    use 'kyazdani42/nvim-web-devicons'
    -- use 'kyazdani42/nvim-tree.lua'

    -- syntax hightlighting
    use 'sheerun/vim-polyglot'
    use { 'nvim-treesitter/nvim-treesitter', config = config_path('treesitter') }

    -- Version Control
    use { 'lewis6991/gitsigns.nvim', config = config_path('gitsigns') }
    use 'tpope/vim-fugitive'
    use { 'APZelos/blamer.nvim', config = config_path('blamer') }

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope.nvim', config = config_path('telescope') }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- LSP
    use { 'neovim/nvim-lspconfig', config = config_path('lspconfig') }

    -- Autocompletion
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-vsnip" },
        { "hrsh7th/vim-vsnip" }
      },
      config = config_path('cmp')
    }


    use 'editorconfig/editorconfig-vim'
    use 'norcalli/nvim-colorizer.lua'

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
