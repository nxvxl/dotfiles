return {
  { 'folke/tokyonight.nvim', lazy = true },
  { 'navarasu/onedark.nvim', lazy = true },
  { 'gruvbox-community/gruvbox', lazy = true },
  { 'shaunsingh/nord.nvim', lazy = true },
  { 'bluz71/vim-moonfly-colors', laszy = true },

  -- Fancier statusline
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({
        options = {
          section_separators = '',
          component_separators = ''
        }
      })
    end
  }
}
