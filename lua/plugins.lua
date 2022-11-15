-- bojtstrap packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- managed plugins
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- lsp config
    use 'neovim/nvim-lspconfig'

    -- tokyo night
    use 'folke/tokyonight.nvim'

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }

    -- toggleterm
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- telescope backend performance
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- goes after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

