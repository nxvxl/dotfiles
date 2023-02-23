local nmap = require('utils').nmap

require('gitsigns').setup({
  signs = {
    add = { hl = 'GitGutterAdd', text = '▋' },
    change = { hl = 'GitGutterChange', text = '▋' },
    delete = { hl = 'GitGutterDelete', text = '▋' },
    topdelete = { hl = 'GitGutterDeleteChange', text = '▔' },
    changedelete = { hl = 'GitGutterChange', text = '▎' },
    untracked = { text = '▋' },
  },
  on_attach = function()
    nmap('[c', ':Gitsigns prev_hunk<CR>')
    nmap(']c', ':Gitsigns next_hunk<CR>')
    nmap('<leader>gbl', ':Gitsigns blame_line<CR>')
  end
})
