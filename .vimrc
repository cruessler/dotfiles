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

" when using Konsole, it is necessary to set TERM=xterm-256color in the
" environment to make colorschemes work properly
" (the default is TERM=xterm which has only 8 colors)
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
" open multiple files in hidden buffers and jump to first opened file
let g:ctrlp_open_multiple_files = 'ij'
" open new files created when pressing <c-y> in the current window
let g:ctrlp_open_new_file = 'r'

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

" to make diff windows always appear side by side, even when space might be
" limited
set diffopt=filler,vertical

" http://vimcasts.org/episodes/soft-wrapping-text/
" when soft wrapping long lines, show an indicator for wrapped lines
" :help showbreak
let &showbreak='… '

" :help autoindent
" :help smartindent
set autoindent
set smartindent

" http://stackoverflow.com/questions/4465095/vim-delete-buffer-without-losing-the-split-window
" use :Bd for closing buffers without closing splits
command Bd bp\|bd \#

" https://github.com/ElmCast/elm-vim
" https://github.com/avh4/elm-format
" format Elm code on save
let g:elm_format_autosave = 1

" https://github.com/tpope/vim-dispatch
nmap <silent> <leader>d :Dispatch<CR>

" https://github.com/janko-m/vim-test
let test#strategy = "dispatch"

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>f :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader><leader> :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" :help surround
let g:surround_187 = "»\r«"
let g:surround_171 = "»\r«"
let g:surround_8250 = "›\r‹"
let g:surround_8249 = "›\r‹"

" http://www.wezm.net/technical/2016/09/ripgrep-with-vim/
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m

  let g:ackprg = 'rg --vimgrep --no-heading'
endif
