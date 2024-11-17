" Autocomplete
lua require('nvim-cmp')
" Lualine
lua require('lualine-cfg')
" Gistings
lua require('gitsigns-cfg')
set noshowmode

" Ident
set softtabstop=2
set tabstop=2                " Define la longitud de un tabulador como 2 espacios
set shiftwidth=2             " Define la cantidad de espacios usados para la indentación

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1

" Markdown Preview
nmap <C-m> <Plug>MarkdownPreviewToggle

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 1
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'firefox'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']

" 'Error-Lens'
lua << EOF
	require'lspconfig'.pyright.setup{}
	require'trouble'.setup {}
  require'lsp-colors'.setup {}
EOF
