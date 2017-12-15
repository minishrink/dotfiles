" --------------
"   v i m r c
" --------------

" ---------------
"   appearance
" ---------------

" true colour
set t_Co=16

" airline theme for tabline
let g:airline_theme='jellybeans'

" highlight current line
set cursorline

" number lines
set number

" title of file
set title

" set automatic whitespace stripping
autocmd BufEnter * EnableStripWhitespaceOnSave

" toggle nested code blocks
set foldenable
set foldmethod=indent
set foldlevelstart=20
set foldnestmax=10

" set tab width
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

" show matching parentheses
set showmatch
" highlight matching search terms
set hlsearch
" ignore case
set ignorecase
" unless capital letters included
set smartcase

" start scrolling 5 lines away from top/bottom
set scrolloff=5

" remap some commands
nmap redo <C-r>

" stop setting .swp file backups
set noswapfile

" config which sides vim panes appear on
set splitright
set splitbelow

" --------------------
"    ocaml plugins
" --------------------

" only run this is opam is installed

if executable("opam")
  let g:opam_share_dir = substitute(system('opam config var share'),'\n$','','''')
  let g:ocaml_ocp_indent = g:opam_share_dir . "/ocp-indent/vim"
  let g:opamshare = substitute(system('opam config var share'),'\n$','','''')

  let g:ocaml_has_ocpindent = 1
  execute "set rtp+=" . g:ocaml_ocp_indent
  execute "set rtp+=" . g:opamshare . "/merlin/vim"
  set rtp^="/home/akanksha/.opam/system/share/ocp-indent/vim"
endif

" -----------------
"    vim-plug
" -----------------

" start of plugin list for vim-plug manager
call plug#begin('~/.vim/plugged')

" Plugin for removing trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" Syntax checking and linting that works with OCaml, Python, bash, ...
Plug 'w0rp/ale'

" get some snazzy colour schemes
Plug 'rafi/awesome-vim-colorschemes'

" enable coloured tabs at bottom
Plug 'vim-airline/vim-airline'

" enable themes for airline tabs
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"   ------------------------------
"      ALE configuration
" ------------------------------

" Don't run linters as I type
let g:ale_lint_on_text_changed = 'never'
" Don't run linters when opening a file to avoid hangs when opening large files
let g:ale_lint_on_enter = 0

