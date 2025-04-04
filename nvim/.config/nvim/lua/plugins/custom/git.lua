return {
  { 'tpope/vim-fugitive', command = "G" },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local nmap = require('utils').nmap

      require('gitsigns').setup({
        signs = {
          add = { text = '▋' },
          change = { text = '▋' },
          delete = { text = '▋' },
          topdelete = { text = '▔' },
          changedelete = { text = '▎' },
          untracked = { text = '▋' },
        },
        on_attach = function()
          nmap('[c', ':Gitsigns prev_hunk<CR>')
          nmap(']c', ':Gitsigns next_hunk<CR>')
          nmap('<leader>gp', ':Gitsigns preview_hunk<CR>')
          nmap('<leader>gr', ':Gitsigns reset_hunk<CR>')
          nmap('<leader>gs', ':Gitsigns stage_hunk<CR>')
          nmap('<leader>gu', ':Gitsigns undo_stage_hunk<CR>')
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
