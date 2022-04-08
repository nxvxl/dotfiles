local indent = 2
local home = vim.fn.getenv('HOME')
local nvim_dir = home .. '/.local/share/nvim'

-- global options
vim.o.title = true
vim.o.laststatus = 2
vim.o.showmode = false
vim.o.background = "dark"
vim.o.foldlevelstart = 20
vim.o.completeopt = "menu,menuone,noselect"
vim.o.listchars = 'tab:│ ,trail:·,eol:↲'
-- vim.o.list = true
-- vim.o.listchars = 'tab:│ ,trail:·,eol:↲'
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.hidden = true
vim.o.backup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = nvim_dir .. '/undodir'

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.updatetime = 300

vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true
-- vim.o.t_Co = "256"
vim.o.incsearch = true
vim.o.hlsearch = false

vim.o.shiftwidth = indent
vim.o.tabstop = indent
vim.o.softtabstop = indent
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.pumheight = 15
-- vim.o.guicursor = 'i:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'

-- window options
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.wrap = false
vim.wo.scrolloff = 10
vim.wo.sidescrolloff = 10
vim.wo.signcolumn = "yes"
vim.wo.foldmethod = "indent"
vim.wo.list = true
vim.wo.breakindent = true
vim.wo.showbreak = "   \\"
vim.wo.linebreak = true
