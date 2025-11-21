local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- local signs = { Error = "❌", Warn = "⚠️", Hint = "💡", Info = "ℹ️" }
for name, icon in pairs(signs) do
  name = "DiagnosticSign" .. name
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = false,
  float = {
    width = 80,
    border = "single",
    source = true,
  }
})

vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump({ count = -1})
end)
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump({ count = 1 })
end)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
