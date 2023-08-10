local utils = require('utils')
local nmap = utils.nmap
local imap = utils.imap
local vmap = utils.vmap
local tmap = utils.tmap

-- Remap for dealing with word wrap
nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- cycle through buffers
nmap('<leader><Tab>', ':bnext<CR>')
nmap('<leader><S-Tab>', ':bprev<CR>')
nmap('<C-Tab>', ':bnext<CR>')
nmap('<C-S-Tab>', ':bprev<CR>')

-- better indenting
vmap('<', '<gv')
vmap('>', '>gv')

-- shift lines
vmap('J', ":m '>+1<CR>gv=gv")
vmap('K', ":m '<-2<CR>gv=gv")

-- greatest remap ever
vmap('<leader>p', '"_dP')
nmap('<leader>p', '"+p')
nmap('<leader>p', '"+P')

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

-- quickfix list navigation
nmap('<C-S-j>', ':cnext<CR>')
nmap('<C-S-k>', ':cprevious<CR>')

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

--[[
nmap('bdo', function()
  local bufs = vim.api.nvim_list_bufs()
  local current_buf = vim.api.nvim_get_current_buf()
  local deleted = 0

  for _, buf in ipairs(bufs) do
    local is_loaded = vim.api.nvim_buf_is_loaded(buf)
    local is_valid = vim.api.nvim_buf_is_valid(buf)
    if buf ~= current_buf and is_valid then
      vim.api.nvim_buf_delete(buf, {})
      deleted = deleted + 1
    end
  end

  if deleted > 0 then
      print("deleted buffers: " .. deleted)
  end
end)
--]]
