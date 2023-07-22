-- managed plugins
return require('packer').startup(function(use)
    -- packer can update itself
    use 'wbthomason/packer.nvim'

    -- lsp-zero v2
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    -- nightfox
    use 'EdenEast/nightfox.nvim'

    -- telescope backend performance
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- undotree
    use 'mbbill/undotree'

    -- fugitive
    use 'tpope/vim-fugitive'

    -- nvim-web-devicons
    use 'nvim-tree/nvim-web-devicons'

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }

    -- nvim-tresitter
    use 'nvim-treesitter/nvim-treesitter'

    -- vimspector
    use {
        "puremourning/vimspector",
        cmd = { "VimspectorInstall", "VimspectorUpdate" },
        fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
        config = function()
            require("config.vimspector").setup()
        end,
    }

    -- markdown-preview
    vim.g.mkdp_port = "8000"
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })
end)
