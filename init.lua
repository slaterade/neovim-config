------------
-- LEADER --
------------
vim.g.mapleader = [[ ]]
vim.g.localleader = [[,]]

-- debug, re-enable this when needed
vim.lsp.set_log_level("off")

-------------
-- OPTIONS --
-------------
local opt = vim.opt

-- line numbers
opt.nu = true
opt.relativenumber = true

-- tabs and indent
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- search
opt.hlsearch = true
opt.incsearch = true

-- undo and backup
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- scroll vertical and horizontal
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.wrap = false

-- misc
opt.termguicolors = true
opt.updatetime = 50

-- cant remember why
opt.mouse = ""

-------------
-- PLUGINS --
-------------

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- plugins and their configs
local plugins = {

    -- nightfox
    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000, -- load before all other start plugins
        config = function()
            require('nightfox').setup({
                options = {
                    transparent = true,
                    dim_inactive = true,
                }
            })
            vim.cmd([[colorscheme nightfox]])
        end,
    },

    -- neodev
    { "folke/neodev.nvim",                        opts = {} },

    -- nvim-cmp and nvim-lspconfig
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },

    -- nvim-web-devicons
    { 'nvim-tree/nvim-web-devicons',              lazy = true },

    -- telescope backend performance fuzzy finder
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup {
                extensions = {
                    fzf = {
                        fuzzy = true,
                        case_mode = "smart_case",
                    }
                }
            }
            require('telescope').load_extension('fzf')
        end,
    },

    -- undotree
    { 'mbbill/undotree' },

    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = "nvim-tree/nvim-web-devicons",
        config = true,
    },

    -- nvim-tresitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup {
                highlight = { enable = true, },
                ensure_installed = {
                    'bash',
                    'c',
                    'cmake',
                    'cpp',
                    'css',
                    'dockerfile',
                    'gitignore',
                    'javascript',
                    'json',
                    'lua',
                    'markdown',
                    'python',
                    'toml',
                    'tsx',
                    'typescript',
                    'vim',
                    'yaml',
                }
            }
        end,
    },
}

require("lazy").setup(plugins)

----------------------
-- LANGUAGE SERVERS --
----------------------

-- add cmp_nvim_lsp capabilities settings to lspconfig
-- this should be executed before we configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

-- enable features only when language server is active
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<leader>gh', ':ClangdSwitchSourceHeader<cr>', opts)
    end,
})

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

-- language server setup: lua
require 'lspconfig'.lua_ls.setup {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                -- library = vim.api.nvim_get_runtime_file("", true)
            }
        })
    end,
    settings = {
        Lua = {}
    }
}

-- language server setup: clangd (C/C++)
require('lspconfig').clangd.setup({
    name = 'clangd',
    cmd = { 'clangd', '--background-index', '--clang-tidy' }, -- add log=verbose if needed
    initialization_options = {
        fallback_flags = { '-std=c++17' },
    },
})


-- language server setup: bash
require 'lspconfig'.bashls.setup {}

-- language server setup: cmake
require 'lspconfig'.cmake.setup {}

-- language server setup: docker
require 'lspconfig'.dockerls.setup {}

-- language server setup: python
require 'lspconfig'.pyright.setup {}

-- setup autocompletion
local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({}),
})

-------------
-- KEYMAPS --
-------------
local kmap = vim.keymap.set

-- normal mode keymaps
kmap("n", "<leader>q", ":<cmd>qa<cr>")
kmap("n", "<leader>ee", ":Ex<cr>")
kmap("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>")
kmap("n", "<leader>cs", ":noh<cr>") -- clear search term
kmap("n", "<leader>ts", ":setlocal spell! spelllang=en_us<cr>")
kmap("n", "<leader>tw", ":set wrap!<cr>")
kmap("n", "<leader>tl", ":set nonumber! norelativenumber!<cr>")
kmap("n", "<c-d>", "<c-d>zz")
kmap("n", "<c-u>", "<c-u>zz")
kmap("n", "n", "nzzzv")
kmap("n", "N", "Nzzzv")
kmap("n", "J", "mzJ`z")

-- telescope
local builtin = require('telescope.builtin')
kmap('n', '<leader>ff', builtin.find_files, {})
kmap('n', '<leader>fg', builtin.live_grep, {})
kmap('n', '<leader>fb', builtin.buffers, {})
kmap('n', '<leader>fh', builtin.help_tags, {})

-- undotree
kmap("n", "<leader>u", vim.cmd.UndotreeToggle)

-- visual mode keymaps
kmap("v", "J", ":m '>+1<cr>gv=gv")
kmap("v", "K", ":m '<-2<cr>gv=gv")

-- terminal mode keymaps
kmap("t", "<esc>", "<c-\\><c-n>")

-- commands
vim.cmd('command W w')
vim.cmd('command Q q')
