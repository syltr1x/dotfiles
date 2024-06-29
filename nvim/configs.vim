" LightLine
let g:lightline = {
	      \ 'colorscheme': 'one',
        \ 'active': {
        \   'left': [ ['mode'],
        \             [ 'gitbranch', 'filename', 'modified' ]
        \   ],
        \   'right': [ [ 'fileformat', 'filetype' ], [ 'lineinfo' ] ]
        \ },
        \ 'component' : {
        \   'gitbranch': 'FugitiveHead',
        \   'lineinfo': '%3l:%-2v%<',
        \ },
        \ }

" Ident
set tabstop=2                " Define la longitud de un tabulador como 2 espacios
set shiftwidth=2             " Define la cantidad de espacios usados para la indentación
set expandtab                " Usa espacios en lugar de tabuladores

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1

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
