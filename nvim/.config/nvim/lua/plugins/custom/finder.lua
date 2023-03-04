return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require('telescope.actions')

      require('telescope').setup {
        defaults = {
          file_ignore_patterns = {
            'node_modules/*',
            '^.git/*',
            '[.]min[.](js|css)$'
          },
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              ["<C-x>"] = actions.delete_buffer
            },
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden"
          }
        },
      }

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'live_grep_args')

      -- S?e `:help telescope.builtin`
      vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles,
        { desc = '[O] Find recently opened files' })
      vim.keymap.set('n', '<leader>\\', function()
        require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({
          winblend = 10,
          previewer = false
        }))
      end, { desc = '[\\] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        require('telescope.builtin').current_buffer_fuzzy_find(
          require('telescope.themes').get_dropdown({
            winblend = 10,
            previewer = false,
          }))
      end, { desc = '[/] Fuzzily search in current buffer]' })

      vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files({ hidden = true }) end,
        { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fg', require("telescope").extensions.live_grep_args.live_grep_args,
        { desc = '[F]ind by [G]rep' })
      vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
      vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
      vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
      vim.keymap.set('n', '<leader>fk', require('telescope.builtin').keymaps, { desc = '[F]ind [K]eymaps' })
      vim.keymap.set('n', '<leader>fq', require('telescope.builtin').quickfix, { desc = '[F]ind [Q]uickfix' })
      vim.keymap.set('n', '<leader>fc', require('telescope.builtin').commands, { desc = '[F]ind [C]ommands' })
      vim.keymap.set('n', '<leader>fa', require('telescope.builtin').builtin, { desc = '[F]ind [A]ll' })
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable('make') == 1
  },
  { "nvim-telescope/telescope-live-grep-args.nvim" }
}
