local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    file_ignore_patterns = { 'node_modules/*' },
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

map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')
