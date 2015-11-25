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

" https://github.com/edkolev/tmuxline.vim#use-vim-airline-colors
" prevent tmuxline from overwriting tmux theme on vim start
" the theme is set manually by loading ~/.tmuxline.conf instead
let g:airline#extensions#tmuxline#enabled=0

" https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|bower_components$\|node_modules$\|_build$\|deps$'
  \ }

" :help colorcolumn
set cc=81

" make vim’s colorscheme behave correctly inside a tmux session
" http://sunaku.github.io/vim-256color-bce.html
if exists('$TMUX')
  set term=screen-256color
endif

" http://vim.wikia.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen
" :help scrolloff
set scrolloff=5

" http://www.johnhawthorn.com/2012/09/vi-escape-delays/
" :help ttimeoutlen
" to make vim go out of insert mode without delay on pressing <Esc>
set ttimeoutlen=0
