return {
  { 'folke/tokyonight.nvim', lazy = true },
  { 'navarasu/onedark.nvim', lazy = true },
  { 'gruvbox-community/gruvbox', lazy = true },

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
