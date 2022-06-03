local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { 'node_modules/*', '.git/*' },
    layout_config = {
      prompt_position = "top"
    },
    sorting_strategy = "ascending",
    mappings = {
      i = {
        ["<esc>"] = actions.close
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
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')

local map = require('utils').map

map('n', '<leader>ff', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>')
map('n', '<leader>fg', ':lua require"telescope.builtin".live_grep() <CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')
map('n', '<leader>fd', ':Telescope diagnostics<CR>')
map('n', '<leader>\\', ':Telescope<CR>')
map('n', 'gr', ':Telescope lsp_references<CR>')
map('n', '<leader>fG', ':Telescope grep_string search=<C-R><C-W><CR>')
map('n', '<C-_>', ':Telescope current_buffer_fuzzy_find<CR>')
map('n', '<C- >', ':Telescope lsp_code_actions<CR>')
