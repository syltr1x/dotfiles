set relativenumber
set number
set cursorline
set mouse=

so ~/.config/nvim/plugins.vim " Incluye la configuracion de plugins
so ~/.config/nvim/configs.vim " Incluye la configuracion de status bar
 
colorscheme kanagawa-wave " Schemens: wave, dragon, lotus
" highlight Normal guibg=NONE ctermbg=NONE " Uncomment this for transparent background
lua require'colorizer'.setup()
let g:error_lens_enabled = 1 " Inicia el Error-Lens


set guicursor=n-v-c:block-Cursor
set guicursor=a:ver100
set clipboard+=unnamed

let g:pyright_path = '/usr/node-path/bin/pyright' " Pyrirght path for Linux

augroup lsp
  autocmd!
  autocmd BufEnter,BufWinENter,TabEnter *.py lua vim.diagnostic.setloclist({open = false})
augroup END
