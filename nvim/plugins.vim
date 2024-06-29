call plug#begin('~/.local/share/nvim/plugged')

" Syntax and Autocomplete
Plug 'neoclide/coc.nvim' " Code Errors
Plug 'neovim/nvim-lspconfig'
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sheerun/vim-polyglot' " Syntax Hihgligth
Plug 'styled-components/vim-styled-components' "Styled-components HighLight
Plug 'folke/trouble.nvim'
Plug 'kosayoda/nvim-lightbulb'
Plug 'yggdroot/indentLine'

" Coding Helpers
Plug 'norcalli/nvim-colorizer.lua' " Color Highlight
Plug 'mattn/emmet-vim'
Plug 'Townk/vim-autoclose' " Autoclose
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-scripts/sh.vim'

Plug 'preservim/nerdtree' " Left Files Menu
Plug 'rebelot/kanagawa.nvim' " Great wave of Kanagawa theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive' " Add Git
Plug 'itchyny/lightline.vim' " Status Bar
Plug 'ryanoasis/vim-devicons' " Needed Icons

call plug#end()
