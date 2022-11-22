-- managed plugins
return require('packer').startup(function(use)
    -- packer can update itself
    use 'wbthomason/packer.nvim'

    -- lsp config
    use 'neovim/nvim-lspconfig'

    -- tokyo night
    use 'folke/tokyonight.nvim'

    -- telescope backend performance
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }

    -- nvim-tresitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- toggleterm
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }
end)
