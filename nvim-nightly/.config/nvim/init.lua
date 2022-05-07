require('plugins')
require('settings')
require('themes')
require('mappings')

vim.diagnostic.config({
  virtual_text = false,
  float = {
    width = 80,
    border = "single"
  }
})
