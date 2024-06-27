set relativenumber
set number
set mouse=

call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim' " Code Errors
Plug 'preservim/nerdtree' " Left Files Menu
Plug 'rebelot/kanagawa.nvim' " Great wave of Kanagawa theme. Color Schemes (-dragon, -wave, -lotus)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive' " Add Git
Plug 'itchyny/lightline.vim' " Barra Inferior
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-scripts/sh.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Townk/vim-autoclose' " Autoclose
Plug 'mattn/emmet-vim'
" ERROR-LENS (START)
Plug 'neovim/nvim-lspconfig'
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/trouble.nvim'
Plug 'kosayoda/nvim-lightbulb'
" ERROR-LENS (END)
Plug 'norcalli/nvim-colorizer.lua' " Color Highlight
call plug#end()

colorscheme kanagawa-wave
highlight Normal guibg=NONE ctermbg=NONE
lua require'colorizer'.setup()
let g:error_lens_enabled = 1 " Inicia el Error-Lens

" Mapear atajos de teclado para abrir y cerrar NERDTree
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-CR> :wincmd w<CR>
set guicursor=n-v-c:block-Cursor
set tabstop=4
set softtabstop=4
set shiftwidth=4
let g:NERDTreeQuitOnOpen = 1
set guicursor=a:ver100
set clipboard+=unnamedplus
set clipboard+=unnamed
set clipboard+=unnamedplus

set laststatus=2  " Mostrar siempre la línea de estado
let g:pyright_path = '/usr/node-v20.15.0-linux-x64/bin/pyright'

" Configuración de Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'lineinfo': 'LightlineLineInfo',
      \ },
      \ 'component_expand': {
      \   'lineinfo': 'lightline#contrib#lineinfo#lineinfo',
      \ }
      \ }

" Configuracion para el Error-Lens
lua << EOF
	require'lspconfig'.pyright.setup{}
	-- Configuracion de Trouble para mostrar errores
	require("trouble").setup {}
	-- Configuracion de lightbulb para mostrar errores en linea
	vim.cmd [[
	augroup LightBulb
		autocmd!
		autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
	augroup END
	]]
EOF

" Configuracion de Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = {"python", "javascript", "html", "css", "bash", "rust", "lua"}, -- Lista de lenguajes
	highlight = {
		enable = true,
	},
}
EOF

augroup lsp
  autocmd!
  autocmd BufEnter,BufWinENter,TabEnter *.py lua vim.diagnostic.setloclist({open = false})
augroup END
