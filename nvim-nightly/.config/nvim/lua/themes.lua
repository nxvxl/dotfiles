-- vim.cmd 'colorscheme  challenger_deep'
-- vim.g.onedark_style = 'black'
-- require('onedark').setup()
--
local h = os.date("%H") * 1

if h > 5 and h < 17 then
  vim.g.tokyonight_style='night'
  vim.cmd 'colorscheme  tokyonight'
else
  vim.cmd 'colorscheme  gruvbox'
end
