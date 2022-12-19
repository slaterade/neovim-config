-- managed plugins
return require('packer').startup(function(use)
  -- packer can update itself
  use 'wbthomason/packer.nvim'

  -- lsp-zero
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  -- nightfox
  use 'EdenEast/nightfox.nvim'

  -- telescope backend performance
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- undotree
  use 'mbbill/undotree'

  -- nvim-web-devicons
  use 'nvim-tree/nvim-web-devicons'

  -- git-blame
  use 'f-person/git-blame.nvim'

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

  -- toggleterm
  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }

end)
