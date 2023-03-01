-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local highlight_active_window = vim.api.nvim_create_augroup("HighlightActiveWindow", { clear = true })
vim.api.nvim_create_autocmd("WinEnter", {
  callback = function ()
    vim.wo.cursorline = true
  end,
  group = highlight_active_window,
  pattern = '*'
})

vim.api.nvim_create_autocmd("WinLeave", {
  callback = function ()
    vim.wo.cursorline = false
  end,
  group = highlight_active_window,
  pattern = '*'
})


