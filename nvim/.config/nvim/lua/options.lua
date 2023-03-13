local indent = 2
local home = vim.fn.getenv('HOME')
local nvim_dir = home .. '/.local/share/nvim'

vim.g.editorconfig = true

-- global options
vim.opt.title = true
vim.opt.laststatus = 2
vim.opt.showmode = false
vim.opt.background = "dark"
vim.opt.foldlevelstart = 20
vim.opt.completeopt = { "menu" , "menuone" , "noselect" }
vim.opt.listchars = { tab = "│ ", trail = "·", eol = "↲" }
vim.opt.shortmess:append("c")
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = nvim_dir .. '/undodir'

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 300

vim.opt.mouse = "a"
-- vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
-- vim.opt.t_Co = "256"
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.shiftwidth = indent
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.pumheight = 15
-- vim.opt.guicursor = 'i:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'

-- window options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.foldmethod = "indent"
vim.opt.list = true
vim.opt.breakindent = true
vim.opt.showbreak = "   ↳"
vim.opt.linebreak = true
