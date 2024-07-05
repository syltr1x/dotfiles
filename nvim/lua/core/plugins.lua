require("lazy").setup({
  "tpope/vim-fugitive",
  "nvim-tree/nvim-tree.lua",
  "tpope/vim-commentary",
  "mattn/emmet-vim",
  "ellisonleao/gruvbox.nvim",
  "hrsh7th/nvim-cmp",
  "christoomey/vim-tmux-navigator",
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "nvim-treesitter/nvim-treesitter",
  "lewis6991/gitsigns.nvim",
  "preservim/vimux",
  "tpope/vim-surround",
  "rebelot/kanagawa.nvim",

  -- completion
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" }
  }, {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
  }, {
    "vinnymeller/swagger-preview.nvim",
    run = "npm install -g swagger-ui-watcher",
  },
})
