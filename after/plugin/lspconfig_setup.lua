-- python language server
-- mac: brew install pyright
require'lspconfig'.pyright.setup {
    -- defaults atm
}

-- lua langauge server
-- mac: brew install lua-language-server
require'lspconfig'.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

-- typescript language server
require'lspconfig'.tsserver.setup {
    -- defaults atm
}

require'lspconfig'.dockerls.setup {
    -- defaults
}

