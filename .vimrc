runtime bundle/vim-pathogen/autoload/pathogen.vim
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

" :help hlsearch
" :help incsearch
set hlsearch
set incsearch

set list
set listchars=tab:»\ ,trail:·

" when using Konsole, it is necessary to set TERM=xterm-256color or
" TERM=screen-256color in the environment to make colorschemes work properly
" (the default is TERM=xterm which has only 8 colors)
set background=dark
" https://github.com/tomasr/molokai
colorscheme molokai

" hide tilde characters at the bottom of the screen
" their color matches the background of the Normal highlight as set by the
" molokai theme, thus letting them disappear
" https://stackoverflow.com/a/40051222
" https://github.com/neovim/neovim/issues/2067#issuecomment-76374860
highlight EndOfBuffer ctermfg=bg ctermbg=bg

" http://vim.wikia.com/wiki/Display_line_numbers
set number

" https://github.com/bling/vim-airline
set laststatus=2

" force vim to detect *.md as Markdown instead of Modula-2
" having this autocmd makes having vim-markdown unnecessary
" https://github.com/tpope/vim-markdown
autocmd BufNewFile,BufReadPost *.md setlocal filetype=markdown | setlocal foldcolumn=2
let g:markdown_folding=1

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

" :help NoMatchParen
" :help DoMatchParen
" do not show matching parentheses because the are quite confusing with my
" current colorscheme
let loaded_matchparen = 1

" http://stackoverflow.com/questions/4465095/vim-delete-buffer-without-losing-the-split-window
" use :Bd for closing buffers without closing splits
command Bd bp\|bd \#

" https://github.com/ElmCast/elm-vim
" https://github.com/avh4/elm-format
" format Elm code on save
let g:elm_format_autosave = 1

" https://github.com/rust-lang/rust.vim/#formatting-with-rustfmt
" format Rust code on save
let g:rustfmt_autosave = 1

" https://github.com/tpope/vim-dispatch
nmap <silent> <leader>d :Dispatch<CR>

" :help surround
let g:surround_187 = "»\r«"
let g:surround_171 = "»\r«"
let g:surround_8250 = "›\r‹"
let g:surround_8249 = "›\r‹"

" http://www.wezm.net/technical/2016/09/ripgrep-with-vim/
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m

  " https://robots.thoughtbot.com/faster-grepping-in-vim
  " define :Grep
  command -nargs=+ -complete=file -bar Grep silent! grep! <args>|cwindow|redraw!

  let g:ackprg = 'rg --vimgrep --no-heading'

  " override CtrlP default behavior defined above
  " https://elliotekj.com/2016/11/22/setup-ctrlp-to-use-ripgrep-in-vim/
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" https://github.com/mhinz/vim-mix-format
" as of April 2018, support for .formatter.exs config files is not yet
" provided by many of the Elixir libraries I depend on
" it is thus more sensible to format .ex files manually for the time being
let g:mix_format_on_save = 0
let g:mix_format_silent_errors = 1

" https://github.com/justinmk/vim-sneak
let g:sneak#label = 1
let g:sneak#s_next = 1

command Gcontext Gblame

" https://github.com/amix/vimrc/blob/7fc202ec8895c564c10940a21af357d6c0665368/vimrcs/basic.vim#L227
" shortcuts for faster navigation between splits
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

nmap <leader>gs :Gstatus<CR>
nmap <leader>mf :MixFormat<CR>

nmap <leader>q :bd<CR>
" shortcut for rewrapping a paragraph
nmap <leader>w gqap

nmap <leader><leader> <c-p>
