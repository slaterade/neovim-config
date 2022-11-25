-- managed plugins
return require('packer').startup(function(use)
  -- packer can update itself
  use 'wbthomason/packer.nvim'

  -- lsp config
  use 'neovim/nvim-lspconfig'

  -- nightfox
  use "EdenEast/nightfox.nvim"

  -- telescope backend performance
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- git-blame
  use 'f-person/git-blame.nvim'

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  -- nvim-tresitter
  use 'nvim-treesitter/nvim-treesitter'

  -- toggleterm
  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }
end)
