local nmap = require('utils').nmap

vim.diagnostic.config({
  virtual_text = false,
  float = {
    width = 80,
    border = "single"
  }
})

nmap('[d', vim.diagnostic.goto_prev)
nmap(']d', vim.diagnostic.goto_next)
nmap('<space>q', vim.diagnostic.setloclist)
nmap('<space>e', vim.diagnostic.open_float)
