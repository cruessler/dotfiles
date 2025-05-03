" use % in languages without curly braces
" https://vi.stackexchange.com/questions/126/using-in-languages-without-curly-braces
runtime macros/matchit.vim

" nvim uses lazy to load plugins
if !has('nvim')
  runtime bundle/vim-pathogen/autoload/pathogen.vim
  execute pathogen#infect()
endif

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

if !has('nvim')
  " https://github.com/tomasr/molokai
  " https://stackoverflow.com/a/40082974
  " use `make bootstrap_nvim` to copy the colorscheme into the right place
  " should it ever become unavailable, https://github.com/tanvirtin/monokai.nvim
  " might be an alternative
  source ~/.vim/colors/molokai.vim

  " hide tilde characters at the bottom of the screen
  " their color matches the background of the Normal highlight as set by the
  " molokai theme, thus letting them disappear
  " https://stackoverflow.com/a/40051222
  " https://github.com/neovim/neovim/issues/2067#issuecomment-76374860
  highlight EndOfBuffer ctermfg=bg ctermbg=bg
endif

" http://vim.wikia.com/wiki/Display_line_numbers
set number

" :help signcolumn
" this prevents layout shift
set signcolumn=yes

" reload files that have been changed outside of vim
set autoread

" used by fugitive’s :Git window
set previewheight=25

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

" https://github.com/junegunn/fzf.vim#preview-window
let g:fzf_preview_window = 'right:60%'

" :help colorcolumn
set cc=81

" make vim’s colorscheme behave correctly inside a tmux session
" http://sunaku.github.io/vim-256color-bce.html
if exists('$TMUX') && !has('nvim')
  set term=screen-256color
endif

" http://vim.wikia.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen
" :help scrolloff
set scrolloff=5

" http://www.johnhawthorn.com/2012/09/vi-escape-delays/
" :help ttimeoutlen
" to make vim go out of insert mode without delay on pressing <Esc>
set ttimeoutlen=0

" `vertical` to make diff windows always appear side by side, even when space
" might be limited
" :help diffopt
" https://git-scm.com/docs/diff-options#Documentation/diff-options.txt-codehistogramcode
set diffopt=filler,vertical,algorithm:histogram

" http://vimcasts.org/episodes/soft-wrapping-text/
" when soft wrapping long lines, show an indicator for wrapped lines
" :help showbreak
let &showbreak='… '

" :help autoindent
" :help smartindent
set autoindent
set smartindent

" https://github.com/airblade/vim-gitgutter/tree/a986ab054788776dca269d6c289b470255d54e8c#getting-started
" vim-gitgutter’s delay for updating its marks depends on this value
" vim’s default is 4000
set updatetime=100

" :help NoMatchParen
" :help DoMatchParen
" do not show matching parentheses because they are quite confusing with my
" current colorscheme
let loaded_matchparen = 1

" http://stackoverflow.com/questions/4465095/vim-delete-buffer-without-losing-the-split-window
" use :Bd for closing buffers without closing splits
command Bd bp\|bd \#

" :help surround
let g:surround_187 = "»\r«"
let g:surround_171 = "»\r«"
let g:surround_8250 = "›\r‹"
let g:surround_8249 = "›\r‹"

" http://www.wezm.net/technical/2016/09/ripgrep-with-vim/
if executable("rg")
  if !has('nvim')
    " Neovim >= 0.10 defaults to `rg`.
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
  endif

  " https://robots.thoughtbot.com/faster-grepping-in-vim
  " define :G
  command -nargs=+ -complete=file -bar G silent! grep! <args>|cwindow|redraw!

  " In normal as well as in visual mode, K can be used to search for the word
  " under the cursor. Which program or command gets called depends on the
  " value of `keywordprg`. vim’s default for `keywordprg` is `man`.
  "
  " :help K
  " :help keywordprg
  "
  " This changes the default to `:G`. Depending on the file type, this setting
  " gets overwritten via autocommands (vim-rails e. g. does that to invoke
  " `ri`).
  set keywordprg=:G

  " Define a separate shortcut for `:G`. This is useful if `keywordprg` has
  " been changed by an autocommand.
  nmap <leader>K :G <cword><CR>
  " <c-u> clears the command line which is prefilled with '<,'>
  " @* refers to the contents of the * register
  " the * register contains the visual selection
  vmap <leader>K :<c-u>execute "G " . shellescape(@*)<CR>
endif

" https://github.com/justinmk/vim-sneak
let g:sneak#label = 1
let g:sneak#s_next = 1

command Gcontext Gblame

" same shortcut as reset hunk which is provided by nvim + gitsigns
nmap <leader>hr <Plug>(GitGutterUndoHunk)

" https://github.com/amix/vimrc/blob/7fc202ec8895c564c10940a21af357d6c0665368/vimrcs/basic.vim#L227
" shortcuts for faster navigation between splits
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

nmap <c-n> <Plug>(GitGutterNextHunk)
nmap <c-p> <Plug>(GitGutterPrevHunk)
nmap <bs> <c-^>

nmap <leader>gs :Git<CR>

nmap <c-q> :bd<CR>
nmap <leader>q :bd<CR>
" shortcut for rewrapping a paragraph
nmap <leader>w gqap

nmap <leader><leader> :Buffers<CR>
nmap <leader>fc :Commits<CR>
" https://github.com/junegunn/fzf.vim/issues/121#issuecomment-575922206
nmap <leader>ff :GitFiles --cached --others --exclude-standard<CR>
nmap <leader>fm :GitFiles?<CR>
nmap <leader>L :Lines<CR>

nmap <leader><CR> :w<CR>

nnoremap _ -
nnoremap j gj
nnoremap k gk
