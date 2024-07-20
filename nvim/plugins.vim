call plug#begin('~/.local/share/nvim/plugged')

" Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'

" Error Lens
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sheerun/vim-polyglot' " Syntax Hihgligth
Plug 'styled-components/vim-styled-components' "Styled-components HighLight
Plug 'folke/trouble.nvim'

" Coding Helpers
Plug 'norcalli/nvim-colorizer.lua' " Color Highlight
Plug 'mattn/emmet-vim'
Plug 'Townk/vim-autoclose' " Autoclose
Plug 'vim-scripts/sh.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' } " Markdown Preview
Plug 'yggdroot/indentLine'

" Status Bar
Plug 'lewis6991/gitsigns.nvim' " Left and bar git signs
Plug 'nvim-lualine/lualine.nvim' " Bar

Plug 'preservim/nerdtree' " Left Files Menu
Plug 'rebelot/kanagawa.nvim' " Great wave of Kanagawa theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive' " Add Git
Plug 'ryanoasis/vim-devicons' " Needed Icons

call plug#end()
