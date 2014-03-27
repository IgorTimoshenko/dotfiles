runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on

set nocompatible

set autoindent
set backspace=indent,eol,start

set colorcolumn=80
highlight ColorColumn ctermbg=7

set copyindent
set encoding=utf-8
set expandtab
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set noerrorbells
set nowrap
set number
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set ruler
set shiftround
set shiftwidth=4
set showmatch
set smartcase
set smarttab
set t_Co=256
set tabstop=4
set title
set undolevels=1000
set visualbell
set wildignore=*.swp

let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
