require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "lua", "typescript", "python", "bash" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true,
  },
}
