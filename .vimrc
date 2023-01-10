set modeline
set nocompatible
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set guioptions-=T
set vb t_vb=
set ruler
set ignorecase
set smartcase
set hls
set incsearch
set shortmess=a
set cmdheight=2
set lbr
set t_Co=256
syntax on
filetype plugin indent on
set backspace=indent,eol,start
set history=150
set showcmd
set list
set listchars=tab:>-,trail:-
set nowrapscan
set mouse=
set noexpandtab
autocmd FileType make set ts=8 sw=8
runtime! ftplugin/man.vim
map z; "jyl:!jdp j
map z' "jye:!jdp j
map z" "jyE:!jdp j
