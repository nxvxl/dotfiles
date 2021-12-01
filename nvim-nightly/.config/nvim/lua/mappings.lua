local utils = require'utils'
local nmap = utils.nmap
local imap = utils.imap
local vmap = utils.vmap
local tmap = utils.tmap

nmap('<leader><Tab>', ':bnext<CR>')
nmap('<leader><S-Tab>', ':bprev<CR>')

-- better indenting
vmap('<', '<gv')
vmap('>', '>gv')

-- shift lines
vmap('J', ":m '>+1<CR>gv=gv")
vmap('K', ":m '<-2<CR>gv=gv")

-- greatest remap ever
vmap('<leader>p', '"_dP')

-- yank into system clipboard
vmap('<leader>y', '"+y')
nmap('<leader>y', '"+y')
nmap('<leader>Y', 'gg"+yG')

-- delete lines without registers
nmap('<leader>d', '"_d')
vmap('<leader>d', '"_d')

-- yank from current cursor to the end of the line
nmap('Y', 'y$')

nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')

-- treat as break point on undo history
imap(',', ',<C-g>u')
imap('.', '.<C-g>u')
imap('!', '!<C-g>u')
imap('?', '?<C-g>u')
imap(':', ':<C-g>u')
imap(';', ';<C-g>u')

-- window navigations
nmap('<C-h>', ':wincmd h<CR>')
nmap('<C-j>', ':wincmd j<CR>')
nmap('<C-k>', ':wincmd k<CR>')
nmap('<C-l>', ':wincmd l<CR>')

-- terminal mode window navigations
tmap('<C-h>', '<C-\\><C-n>:wincmd h<CR>')
tmap('<C-j>', '<C-\\><C-n>:wincmd j<CR>')
tmap('<C-k>', '<C-\\><C-n>:wincmd k<CR>')
tmap('<C-l>', '<C-\\><C-n>:wincmd l<CR>')

-- exit terminal mode
tmap('<ESC><ESC>', '<C-\\><C-n>')
