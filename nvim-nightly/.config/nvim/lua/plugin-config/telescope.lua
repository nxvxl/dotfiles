local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    -- file_sorter = require('telescope.sorters').get_fzy_sorter,
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
  },
}

local map = require('utils').map

map('n', '<leader>ff', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>')
map('n', '<leader>fg', ':lua require"telescope.builtin".live_grep{ hidden = true } <CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')
map('n', '<leader>\\', ':Telescope<CR>')
map('n', 'gr', ':Telescope lsp_references<CR>')
