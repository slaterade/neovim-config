local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'bashls',
  'clangd',
  'dockerls',
  'eslint',
  'marksman',
  'pyright',
  'sumneko_lua',
  'tsserver',
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<Left>'] = cmp.mapping.abort(),
  ['<Right>'] = cmp.mapping.complete(),
  --['<Tab>'] = cmp.mapping.confirm(),
})

-- disable completion with enter key tyvm
--cmp_mappings['<CR>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  completion = {
    autocomplete = false
  },
})

-- add keymaps only when attached to a language
lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', '<leader>lf', vim.cmd.LspZeroFormat, opts)
end)

lsp.setup()
