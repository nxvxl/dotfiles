return {
  { 'tpope/vim-fugitive', command = "G" },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local nmap = require('utils').nmap

      require('gitsigns').setup({
        signs = {
          add = { hl = 'GitGutterAdd', text = '▋' },
          change = { hl = 'GitGutterChange', text = '▋' },
          delete = { hl = 'GitGutterDelete', text = '▋' },
          topdelete = { hl = 'GitGutterDeleteChange', text = '▔' },
          changedelete = { hl = 'GitGutterChange', text = '▎' },
          untracked = { text = '▋' },
        },
        on_attach = function()
          nmap('[c', ':Gitsigns prev_hunk<CR>')
          nmap(']c', ':Gitsigns next_hunk<CR>')
          nmap('<leader>gbl', ':Gitsigns blame_line<CR>')
        end
      })
    end
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  }
}
