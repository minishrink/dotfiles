" **************
"  vimrc config
" **************

" ***************
"   appearance
" ***************
"
" Colour schemes
set t_Co=256 " 256 colours
set background=dark
colorscheme molokai
if exists('$TMUX')
  " colorscheme railscasts
  syntax on
  set cursorline
  highlight Normal ctermbg=59
  highlight CursorLine ctermbg=darkblue cterm=bold ctermfg=white
else
  highlight CursorLine cterm=bold ctermbg=235 ctermfg=none
endif
" let g:base16_shell_path=base16-builder/output/shell

" highlight current line
set cursorline
" colorscheme molokai
" set cursorcolumn
" highlight CursorLine ctermbg=233 cterm=bold ctermfg=white
" hi Normal ctermbg=none
" hi NonText ctermbg=black

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

" syntax
" syntax enable

" remap :redo to ctrl+r
nmap redo <C-r>

" stop setting .swp file backups
set noswapfile
" ********************
"  ocaml plugins
" ********************

let g:opam_share_dir = substitute(system('opam config var share'),'\n$','','''')
let g:ocaml_ocp_indent = g:opam_share_dir . "/ocp-indent/vim"
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"
let g:ocaml_has_ocpindent = 1
execute "set rtp+=" . g:ocaml_ocp_indent
execute "set rtp+=" . g:opamshare . "/merlin/vim"
set rtp^="/home/akanksha/.opam/system/share/ocp-indent/vim"

" *****************
" vim-plug
" *****************
call plug#begin('~/.vim/plugged')

" OCaml
Plug 'rgrinberg/vim-ocaml'

" Plugin for removing trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" Syntax checking and linting that works with OCaml, Python, bash, ...
Plug 'w0rp/ale'

call plug#end()


" ******************************
" " ALE configuration
" " ******************************
" Don't run linters as I type
let g:ale_lint_on_text_changed = 'never'
" Don't run linters when opening a file to avoid hangs when opening large OCaml files
let g:ale_lint_on_enter = 0

