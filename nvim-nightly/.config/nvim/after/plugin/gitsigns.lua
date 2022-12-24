local nmap = require('utils').nmap

require'gitsigns'.setup{
  signs = {
      add = {hl = 'GitGutterAdd', text = '▋'},
      change = {hl = 'GitGutterChange',text= '▋'},
      delete = {hl= 'GitGutterDelete', text = '▋'},
      topdelete = {hl ='GitGutterDeleteChange',text = '▔'},
      changedelete = {hl = 'GitGutterChange', text = '▎'},
    },
  on_attach = function()
    nmap('[c', ':Gitsigns prev_hunk<CR>')
    nmap(']c', ':Gitsigns next_hunk<CR>')
  end
}
