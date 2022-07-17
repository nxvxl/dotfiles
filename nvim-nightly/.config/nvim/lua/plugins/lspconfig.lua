local nvim_lsp = require('lspconfig')
local nmap = require('utils').nmap

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { buffer = bufnr }
  nmap('gd', vim.lsp.buf.definition, opts)
  nmap('K', vim.lsp.buf.hover, opts)
  nmap('<space>ca', vim.lsp.buf.code_action, opts)

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.documentFormattingProvider then
    nmap("<space>f", vim.lsp.buf.formatting, opts)
  elseif client.server_capabilities.documentRangeFormattingProvider then
    nmap("<space>f", vim.lsp.buf.range_formatting, opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#44475a
      hi LspReferenceText cterm=bold ctermbg=red guibg=#44475a
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#44475a
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  print('LSP Attached')
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "tsserver", "pyright", "clangd", "vuels", "cssls", "gopls", "html" }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = 'single',
    width = 80
  }
)

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end
