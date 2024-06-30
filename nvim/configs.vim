" LightLine
let g:lightline = {
	      \ 'colorscheme': 'one',
        \ 'active': {
        \   'left': [ ['mode'],
        \             [ 'gitbranch' ],
        \             [ 'filename', 'modified' ]
        \   ],
        \   'right': [ [ 'fileformat', 'filetype' ], [ 'lineinfo' ] ]
        \ },
        \ 'component' : {
        \   'lineinfo': '%3l:%-2v%<',
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead',
        \ },
        \ }

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

let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 1
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
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
	-- Configuracion de Trouble para mostrar errores
	require'trouble'.setup {}
	-- Configuracion de lightbulb para mostrar errores en linea
	vim.cmd [[
	augroup LightBulb
		autocmd!
		autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
	augroup END
	]]
EOF
