local lsp = require('lsp-zero').preset({})

-- local cmp = require('cmp')
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--     ['<Left>'] = cmp.mapping.abort(),
--     ['<Right>'] = cmp.mapping.complete(),
--     --['<Tab>'] = cmp.mapping.confirm(),
-- })

-- lsp.setup_nvim_cmp({
--     mapping = cmp_mappings,
--     completion = {
--         autocomplete = false
--     },
-- })

-- add keymaps only when attached to a language
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set('v', '<Leader>lf', vim.cmd.LspZeroFormat, opts)
    vim.keymap.set('n', '<leader>lf', vim.cmd.LspZeroFormat, opts)
    vim.keymap.set('n', '<leader>ll', ":ClangdSwitchSourceHeader<cr>")
end)

-- lsp.setup_servers({
--     'bashls',
--     'clangd',
--     'cmake',
--     'dockerls',
--     'eslint',
--     'lua_ls',
--     'marksman',
--     'pyright',
--     'tsserver',
-- })

-- Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
