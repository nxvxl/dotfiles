local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { 'node_modules/*', '.git/*' },
    mappings = {
      i = {
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

local nmap = require('utils').nmap

nmap('<leader>ff', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>')
nmap('<leader>fg', ':lua require"telescope.builtin".live_grep() <CR>')
nmap('<leader>fb', ':Telescope buffers<CR>')
nmap('<leader>fh', ':Telescope help_tags<CR>')
nmap('<leader>fd', ':Telescope diagnostics<CR>')
nmap('<leader>fo', ':Telescope oldfiles<CR>')
nmap('<leader>\\', ':Telescope<CR>')
nmap('gr', ':Telescope lsp_references<CR>')
nmap('<leader>fG', ':Telescope grep_string search=<C-R><C-W><CR>')
nmap('<C-_>', ':Telescope current_buffer_fuzzy_find<CR>')
nmap('<C-?>', ':Telescope help_tags<CR>')


vim.cmd('autocmd User TelescopePreviewerLoaded setlocal wrap | setlocal number')
