local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'clangd',
  'dockerls',
  'eslint',
  'marksman',
  'pyright',
  'sumneko_lua',
  'tsserver',
})

lsp.set_preferences({
  --  sign_icons = { }
})

-- add keymaps only when attached to a language
lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  local bind = vim.keymap.set

  bind('n', '<leader>lf', vim.cmd.LspZeroFormat, opts)
end)

lsp.setup()
