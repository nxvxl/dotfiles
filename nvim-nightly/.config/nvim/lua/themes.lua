-- vim.cmd 'colorscheme  challenger_deep'
-- vim.g.onedark_style = 'black'
-- require('onedark').setup()
vim.g.tokyonight_style='night'
vim.cmd 'colorscheme  tokyonight'
require'gitsigns'.setup{
  signs = {
      add = {hl = 'GitGutterAdd', text = '▋'},
      change = {hl = 'GitGutterChange',text= '▋'},
      delete = {hl= 'GitGutterDelete', text = '▋'},
      topdelete = {hl ='GitGutterDeleteChange',text = '▔'},
      changedelete = {hl = 'GitGutterChange', text = '▎'},
    }
}
