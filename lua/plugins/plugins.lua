vim.cmd [[packadd packer.nvim]]
require("plugins.mason")

return require('packer').startup(function()
  -- gerenciador de plugins 
  use 'wbthomason/packer.nvim'
  use { "williamboman/mason.nvim" }
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- icones 
  use 'terroo/vim-simple-emoji'
  use 'kyazdani42/nvim-web-devicons'
  
  -- temas
  use 'navarasu/onedark.nvim'
  use 'tamton-aquib/staline.nvim'

  -- dashboard
  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  -- agilizadores de digitar, como adicionar "" e ()
  use 'lukas-reineke/indent-blankline.nvim'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'ray-x/lsp_signature.nvim'
  use 'onsails/lspkind-nvim'
  
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  
  -- snippets
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  
  -- nvim e bufferline
  use {'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }}
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  
  -- movimentação
  use 'matze/vim-move'
 
  -- terminal
  use 'voldikss/vim-floaterm'
  
  -- formatação
  use 'prettier/vim-prettier'
end)

