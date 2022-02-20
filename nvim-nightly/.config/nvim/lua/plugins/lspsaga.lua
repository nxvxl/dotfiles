local utils = require('utils')
local nmap = utils.nmap
local vmap = utils.vmap

require'lspsaga'.init_lsp_saga()

-- code actions
nmap('<leader>ca', ':Lspsaga code_action<CR>')
vmap('<leader>ca', ':<C-U>Lspsaga range_code_action<CR>')

-- show hover doc
nmap('<silent>K', ':Lspsaga hover_doc<CR>')

-- signature help
nmap('gs', ':Lspsaga signature_help<CR>')

-- rename
nmap('<leader><F2>', ':Lspsaga rename<CR>')

-- preview definition
nmap('<leader>gd', ':Lspsaga preview_definition<CR>')

-- jump to diagnostics
nmap('[e', ':Lspsaga diagnostic_jump_prev<CR>')
nmap(']e', ':Lspsaga diagnostic_jump_next<CR>')
