local utils = require'utils'
local map = require('utils').map
local nmap = utils.nmap
local imap = utils.imap

map('n', '<leader><Tab>', ':bnext<CR>')
map('n', '<leader><S-Tab>', ':bprev<CR>')

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- shift lines
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- greatest remap ever
map('v', '<leader>p', '"_dP')

map('v', '<leader>y', '"+y')
map('n', '<leader>y', '"+y')
map('n', '<leader>Y', 'gg"+yG')

map('n', '<leader>d', '"_d')
map('v', '<leader>d', '"_d')

nmap('Y', 'y$')

nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')

imap(',', ',<C-g>u')
imap('.', '.<C-g>u')
imap('!', '!<C-g>u')
imap('?', '?<C-g>u')
imap(':', ':<C-g>u')
imap(';', ';<C-g>u')
