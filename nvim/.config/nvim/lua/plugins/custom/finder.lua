return {
  {
    'nvim-telescope/telescope.nvim',
    -- branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require('telescope.actions')
      local lga_actions = require("telescope-live-grep-args.actions")

      require('telescope').setup {
        defaults = {
          file_ignore_patterns = {
            'node_modules/*',
            '^.git/*',
            '[.]min[.](js|css)$',
            'venv/*'
          },
          mappings = {
            i = {
              ["<C-x>"] = actions.delete_buffer,
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
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
          },
          preview = {
            filesize_limit = 1,
            treesitter = false
          }
        },
      }

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'live_grep_args')

      -- See `:help telescope.builtin`
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
      vim.keymap.set('n', '<leader>fW',
        function() require('telescope.builtin').grep_string({ grep_open_files = true }) end,
        { desc = '[F]ind current [W]ord in opened files' })
      vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
      vim.keymap.set('n', '<leader>fD', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics in workspace' })
      vim.keymap.set('n', '<leader>fd', function ()
        require('telescope.builtin').diagnostics({ bufnr = 0 })
      end, { desc = '[F]ind [D]iagnostics in current buffer' })
      vim.keymap.set('n', '<leader>fk', require('telescope.builtin').keymaps, { desc = '[F]ind [K]eymaps' })
      vim.keymap.set('n', '<leader>fq', require('telescope.builtin').quickfix, { desc = '[F]ind [Q]uickfix' })
      vim.keymap.set('n', '<leader>fc', require('telescope.builtin').commands, { desc = '[F]ind [C]ommands' })
      vim.keymap.set('n', '<leader>fa', require('telescope.builtin').builtin, { desc = '[F]ind [A]ll' })
      vim.keymap.set('n', '<leader>fr', function() require('telescope.builtin').oldfiles({ only_cwd = true }) end,
        { desc = '[F]ind [R]ecent Files in CWD' })


      vim.cmd('autocmd User TelescopePreviewerLoaded setlocal wrap | setlocal number')
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable('make') == 1
  },
  { "nvim-telescope/telescope-live-grep-args.nvim" }
}
