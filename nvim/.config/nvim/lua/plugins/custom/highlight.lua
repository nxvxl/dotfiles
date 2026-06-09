-- return {}
-- return {
--   { 'digitaltoad/vim-pug' }
-- }
return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    config = function()
      require('nvim-treesitter').setup()
    end,
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          -- Enable treesitter highlighting and disable regex syntax
          pcall(vim.treesitter.start)
          -- Enable treesitter-based indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end
  },
  -- {
  --   'nvim-treesitter/nvim-treesitter-textobjects',
  -- }
}
