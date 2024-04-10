------------
-- LEADER --
------------
vim.g.mapleader = [[ ]]
vim.g.localleader = [[,]]

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
                vim.keymap.set('v', '<Leader>gf', vim.lsp.buf.format, opts)
                vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, opts)
                vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>gh', ":ClangdSwitchSourceHeader<cr>")
                vim.diagnostic.config({virtual_text = false})
            end)
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
            require('lspconfig').clangd.setup {} -- install clangd outside of mason
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "bashls",
                    "cmake",
                    "dockerls",
                    "marksman",
                    "pyright",
                },
                automatic_installation = { exclude = { "clangd" } },
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
kmap("n", "<leader>tt", ":ToggleTerm<cr>")
kmap("n", "<leader>tb", ":GitBlameToggle<cr>")
kmap("n", "<leader>tl", ":set nonumber! norelativenumber!<cr>")
kmap("n", "<leader>gs", vim.cmd.Git)
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
