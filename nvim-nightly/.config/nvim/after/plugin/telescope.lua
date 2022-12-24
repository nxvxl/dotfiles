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
require('telescope').load_extension('live_grep_args')

local nmap = require('utils').nmap

local builtin = require("telescope.builtin")

nmap('<leader>ff', function() builtin.find_files({ hidden = true }) end)
nmap('<leader>fg', require("telescope").extensions.live_grep_args.live_grep_args)
nmap('<leader>fG', builtin.grep_string)
nmap('<leader>fb', builtin.buffers)
nmap('<leader>fh', builtin.help_tags)
nmap('<leader>fd', builtin.diagnostics)
nmap('<leader>fo', builtin.oldfiles)
nmap('<leader>fc', builtin.commands)
nmap('<leader>\\', builtin.builtin)
nmap('<C-_>', builtin.current_buffer_fuzzy_find)
nmap('<C-?>', builtin.help_tags)



-- vim.cmd('autocmd User TelescopePreviewerLoaded setlocal wrap | setlocal number')
