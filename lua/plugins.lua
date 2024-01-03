-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
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
    { "folke/neodev.nvim", opts = {} },

    -- lsp-zero
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
        },
        config = function()
            local lsp = require("lsp-zero")
            lsp.on_attach(function(_, bufnr)
                local opts = { buffer = bufnr, remap = false }
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp.default_keymaps({ buffer = bufnr })
                vim.keymap.set('v', '<Leader>gq', vim.cmd.LspZeroFormat, opts)
                vim.keymap.set('n', '<leader>gq', vim.cmd.LspZeroFormat, opts)
                vim.keymap.set('n', '<leader>gh', ":ClangdSwitchSourceHeader<cr>")
                vim.diagnostic.config({virtual_text = false})
            end)
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp.default_setup,
                },
            })
        end,
    },

    -- nvim-web-devicons
    { 'nvim-tree/nvim-web-devicons', lazy = true },

    -- telescope backend performance fuzzy finder
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').load_extension('fzf')
        end,
    },

    -- undotree
    { 'mbbill/undotree' },

    -- fugitive
    { 'tpope/vim-fugitive' },

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
            require("nvim-treesitter.configs").setup {
                highlight = { enable = true, },
                ensure_installed = {
                    'bash',
                    'c',
                    'cmake',
                    'cpp',
                    'css',
                    'dockerfile',
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
