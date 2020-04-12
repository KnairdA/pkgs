syntax enable
filetype plugin indent on

set encoding=utf-8
set showcmd
set nocompatible
set nocursorline
set number
set mouse=a
set shell=/bin/sh
set sessionoptions-=options
set termguicolors

colorscheme akr

" do not update screen during macro execution
set lazyredraw

" global swap
set directory=~/.vim/swap//,.
" permanent undo
set undofile
set undodir=~/.vim/undo

set wrap
set tabstop=4 shiftwidth=4
set backspace=indent,eol,start
set linebreak

set hlsearch
set incsearch
set ignorecase
set smartcase

set wildchar=<Tab> wildmenu wildmode=full

set noautoread

let mapleader=","
let maplocalleader="-"

map <leader>s  :let @/=""<CR>
map <leader>c  zz
map <leader>h  q:
map <leader>d  g<C-]>

nmap <backspace> :e#<CR>
nmap f           za
nmap F           zA

autocmd InsertEnter *   :setlocal nohlsearch
autocmd InsertLeave *   :setlocal hlsearch

autocmd FileType scheme  setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType nix     setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType lisp    setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType racket  setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType python  setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType mako    setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType haskell setlocal shiftwidth=2 tabstop=4 softtabstop=2 shiftround expandtab
autocmd FileType pandoc  setlocal nonumber autoread
autocmd FileType pandoc  let      g:airline#extensions#whitespace#checks=['indent', 'trailing', 'long']
autocmd FileType tex     setlocal noai nocin nosi inde=
autocmd FileType mako    setlocal noai nocin nosi inde=

autocmd BufNewFile,BufRead *.tikz setlocal syntax=tex

" select previous line on file reload, useful when cycling file extensions
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\" zz" | endif
nnoremap <Tab> :CounterpointNext<CR>
nnoremap <S-Tab> :CounterpointPrevious<CR>

" block jumping
nnoremap J }
nnoremap K {

"" selection / current line shifting
" vertical shifting
nmap <Up>   [e
nmap <Down> ]e
vmap <Up>   [egv
vmap <Down> ]egv
" horizontal shifting via indentation
nmap <Left>  <<
nmap <Right> >>
vmap <Left>  <gv
vmap <Right> >gv

" buffer cycling
nnoremap <A-Tab>   :bnext<CR>
nnoremap <A-S-Tab> :bprev<CR>

"" switching between viewports
" tabs
nnoremap <C-j> gt
nnoremap <C-k> gT
" splits
nnoremap <A-h> <C-W>h
nnoremap <A-l> <C-W>l
nnoremap <A-k> <C-W>k
nnoremap <A-j> <C-W>j

" quick execution of the q macro
" (i.e. qq to record, q to stop, space to execute)
nnoremap <space> @q

"" plugin config

set laststatus=2
let g:airline_theme                                   = 'akr'
let g:airline#extensions#tabline#enabled              = 1
let g:airline#extensions#tabline#show_buffers         = 1
let g:airline#extensions#tabline#show_tab_type        = 1
let g:airline#extensions#tabline#fnamemod             = ':t'
let g:airline#extensions#tabline#formatter            = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_idx_mode      = 0
let g:airline#extensions#tabline#show_close_button    = 0
let g:airline#extensions#tabline#show_splits          = 0
let g:airline#extensions#tabline#show_tab_nr          = 0
let g:airline#extensions#whitespace#mixed_indent_algo = 2

let g:gitgutter_enabled         = 0
let g:gitgutter_highlight_lines = 1

let g:goyo_width                = 90
let g:goyo_margin_top           = 1
let g:goyo_margin_bottom        = 0

nnoremap <F5> :MundoToggle<CR>
nnoremap <F6> :GitGutterToggle<CR>
nnoremap <F7> :SignatureToggleSigns<CR>
nnoremap <F8> :Goyo<CR>

nnoremap <C-p> :GFiles<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-t> :Tags<CR>
nnoremap <C-l> :Lines<CR>
nnoremap <A-t> :BTags<CR>

let g:undotree_SetFocusWhenToggle = 1

let g:localvimrc_sandbox    = 0
let g:localvimrc_persistent = 2

let g:wordmotion_prefix = '<leader>'
nmap <S-w> <leader>w

let g:gutentags_enabled = 0

if executable('ctags')
	let g:gutentags_enabled = 1
end

let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'

let g:UltiSnipsSnippetDirectories = [$PWD.'/.lvimsnip', $HOME.'/.config/nvim/snip']

let g:mako_detect_lang_from_ext = 0 " breaks on too heavily nested file extensions
let g:mako_default_outer_lang = 'txt'
