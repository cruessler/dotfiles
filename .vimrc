execute pathogen#infect()
syntax on
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab

let mapleader=" "

" prevent split windows on opening a new buffer when the current buffer is
" unsaved
set hidden

set list
set listchars=tab:»\ ,trail:·

set background=dark
" https://github.com/tomasr/molokai
colorscheme molokai
" https://github.com/chriskempson/base16-vim
" seems like base16-shell (by the same author) needs to be installed
" colorscheme base16-vim

" http://vim.wikia.com/wiki/Display_line_numbers
set number

" https://github.com/bling/vim-airline
set laststatus=2

" https://github.com/bling/vim-airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_cmd = 'CtrlPMixed'

" :help colorcolumn
set cc=81
