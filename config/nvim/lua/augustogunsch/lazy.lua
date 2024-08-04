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

local plugins = {
  -- gruvbox-material theme
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function ()
      vim.g.gruvbox_material_transparent_background = 1
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  -- keys cheat sheet
  {
    "folke/which-key.nvim",
    lazy = false,
    priority = 999
  },
  -- status and tab lines
  "nvim-lualine/lualine.nvim",
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = "TSUpdate"
  },
  "nvim-treesitter/nvim-treesitter-context",
  -- harpoon
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false
  },
  "raimondi/delimitmate",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-fugitive",
  "numToStr/Comment.nvim",
  -- smooth scrolling
  {
    "karb94/neoscroll.nvim",
    enabled = false,
    config = function ()
      require('neoscroll').setup {}
    end
  },
  -- mason LSP manager
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  -- indentation guesser
  "tpope/vim-sleuth",
  -- file symbols browser
  "preservim/tagbar",
  -- undo history browser
  "mbbill/undotree",
  -- fuzzy finder
  "nvim-telescope/telescope.nvim",
  -- LSP support
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
  },
  "neovim/nvim-lspconfig",
  -- linting
  "mfussenegger/nvim-lint",
  "psf/black",
  -- autocompletion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  -- snippets
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "nvim-lua/plenary.nvim",
  "nvimtools/none-ls.nvim",
}

require("lazy").setup(plugins)
