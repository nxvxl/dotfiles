local lsp = require("lsp-zero")
local builtin = require("telescope.builtin")
local nmap = require("utils").nmap

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  set_lsp_keymaps = false,
  suggest_lsp_servers = false,
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
    return
  end

  nmap("gd", vim.lsp.buf.definition, opts)
  nmap('gr', builtin.lsp_references, opts)
  nmap("K", vim.lsp.buf.hover, opts)
  nmap("<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  nmap("<leader>vca", vim.lsp.buf.code_action, opts)
  nmap("<leader>vrr", vim.lsp.buf.references, opts)
  nmap("<leader>vrn", vim.lsp.buf.rename, opts)
  nmap("<C-h>", vim.lsp.buf.signature_help, opts)
end)

-- NULL LS setup
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier
  },
})

lsp.setup()
