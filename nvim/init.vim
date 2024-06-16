set relativenumber
set number
set mouse=

call plug#begin('~/.local/share/nvim/plugged')

" Añade los plugins aquí

Plug 'preservim/nerdtree' " Left Files Menu
Plug 'rebelot/kanagawa.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-scripts/sh.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Townk/vim-autoclose'
Plug 'mattn/emmet-vim'
Plug 'goolord/alpha-nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'  " Dependency for telescope

call plug#end()

colorscheme kanagawa-wave

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
highlight Normal guibg=NONE ctermbg=NONE

" Configuracion del banner
lua << EOF
local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
dashboard.section.header.val = {
    '','',
    '                                    ██████                                    ',
    '                                ████▒▒▒▒▒▒████                                ',
    '                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              ',
    '                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            ',
    '                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                              ',
    '                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                          ',
    '                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                          ',
    '                        ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        ',
    '                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ',
    '                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ',
    '                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ',
    '                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ',
    '                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        ',
    '                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        ',
    '                        ██      ██      ████      ████                        ',
}
dashboard.section.buttons.val = {
   dashboard.button( "f", "  Find File", ":Telescope find_files <CR>"),
   dashboard.button( "t", "  Search Text", ":Telescope live_grep <CR>"),
   dashboard.button( "e", "  New File", ":DashboardNewFile <CR>"),
   dashboard.button( "r", "󰋚  Recent Files", ":Telescope oldfiles <CR>"),
   dashboard.button( "h", "  Load Last Session", ":SessionLoad <CR>"),
   dashboard.button( "b", "  Bookmarks", ":Telescope marks <CR>"),
   dashboard.button( "q", "  Quit", ":qa! <CR>"),
}
dashboard.section.footer.val = "Syltr1x Neovim"
alpha.setup(dashboard.opts)
EOF

let g:dashboard_custom_section = {
    \ 'f': { 'description': ['  Find File'], 'command': 'Telescope find_files'},
    \ 't': { 'description': ['  Search Text'], 'command': 'Telescope live_grep'},
    \ 'e': { 'description': ['  New File'], 'command': 'DashboardNewFile'},
    \ 'r': { 'description': ['󰋚  Recent Files'], 'command': 'Telescope oldfiles'},
    \ 'h': { 'description': ['  Load Last Session'], 'command': 'SessionLoad'},
    \ 'b': { 'description': ['  Bookmarks'], 'command': 'Telescope marks'},
    \ 'q': { 'description': ['  Quit'], 'command': 'qa!'}
    \}

let g:dashboard_custom_footer = ['Syltr1x Neovim']
