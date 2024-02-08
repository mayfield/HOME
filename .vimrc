call plug#begin('~/.vim/plugged')
 Plug 'w0rp/ale'
 Plug 'airblade/vim-gitgutter'
 Plug 'mayfield/vim-javascript'
call plug#end()

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
"let g:ale_lint_on_text_changed = 'normal'
"let g:ale_lint_on_insert_leave = 0
"let g:ale_lint_on_enter = 0
let g:ale_lint_delay = 100
let g:ale_virtualtext_cursor = 0
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
set redrawtime=5000

let g:sass_recommended_style = 0

filetype on
filetype plugin on
filetype indent off
syntax on
set backup
set nocompatible
set hlsearch
set mousehide
"set mouse=a
set ignorecase
set smartcase
set incsearch
set history=10000
set scrolloff=8
set titlelen=200
set fo-=cro
set tags=tags;/
set number
set undofile
set undodir=~/.vim/undos
set backupdir=~/.vim/backups
set tabstop=4
set shiftwidth=4
set expandtab
set nofoldenable
" Show search match info
set shortmess-=S

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

colorscheme mayfield_silent

set statusline=%<\ [%n]\ %F\ %m%r
set statusline+=%=
set statusline+=\ line:\ %3l\ of\ %L,\ col:\ %2c\ (%P)\ \ 
set laststatus=2

"vim-gitgutter
set updatetime=200

" uncover the highlight groups for a symbol
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

autocmd BufEnter * :syntax sync fromstart


func! WordProcessor()
  " movement changes
  map j gj
  map k gk
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  setlocal spell spelllang=en_us
  setlocal nobackup
  setlocal noundofile
  setlocal nonumber
endfu
com! WP call WordProcessor()
