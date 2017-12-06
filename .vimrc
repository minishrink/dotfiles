" --------------
"  vimrc config
" --------------

" ---------------
"   appearance
" ---------------
"
" Colour schemes
set t_Co=256 " 256 colours
set background=dark
colorscheme railscasts

" highlight current line
set cursorline

" toggle nested code blocks
set foldenable
set foldmethod=indent
set foldlevelstart=20
set foldnestmax=10

" number lines
set number

" set tab width
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

" title of file
set title

" show matching parentheses
set showmatch
" highlight matching search terms
set hlsearch
" ignore case unless capital letters included
set ignorecase
set smartcase

" Make more context visible around the cursor when scrolling
set scrolloff=7

" remap :redo to ctrl+r
nmap redo <C-r>

" stop setting .swp file backups
set noswapfile

" --------------------
"    ocaml plugins
" --------------------

let g:opam_share_dir = substitute(system('opam config var share'),'\n$','','''')
let g:ocaml_ocp_indent = g:opam_share_dir . "/ocp-indent/vim"
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')

let g:ocaml_has_ocpindent = 1
execute "set rtp+=" . g:ocaml_ocp_indent
execute "set rtp+=" . g:opamshare . "/merlin/vim"
set rtp^="/home/akanksha/.opam/system/share/ocp-indent/vim"

" -----------------
"    vim-plug
" -----------------
"
call plug#begin('~/.vim/plugged')

" Plugin for removing trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" Syntax checking and linting that works with OCaml, Python, bash, ...
Plug 'w0rp/ale'

" get some snazzy colour schemes
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()

"   ------------------------------
" "      ALE configuration
" " ------------------------------
"
" Don't run linters as I type
let g:ale_lint_on_text_changed = 'never'
" Don't run linters when opening a file to avoid hangs when opening large OCaml files
let g:ale_lint_on_enter = 0

