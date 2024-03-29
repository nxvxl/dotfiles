require'nvim-treesitter.configs'.setup({
  ensure_installed = {
    "bash",
    "css",
    "html",
    "javascript",
    "lua",
    "python",
    "typescript",
    "help",
    "vim"
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})
