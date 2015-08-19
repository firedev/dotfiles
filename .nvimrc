let mapleader=' '

call plug#begin('~/.nvim/plugged')
Plug 'benekastah/neomake'

Plug 'janko-m/vim-test'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "neoterm"
Plug 'kassio/neoterm'
let g:neoterm_size = 10
Plug 'Chiel92/vim-autoformat'
Plug 'flazz/vim-colorschemes'
Plug 'slim-template/vim-slim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
call plug#end()

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set t_Co=256
set background=dark
colorscheme Tomorrow-Night

set number
set ruler
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set hidden
set noswapfile
set undodir=~/.vim/undo         " where to save undo histories
set undofile                    " Save undo's after file closes
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo
call matchadd('ColorColumn', '\%' . &textwidth . 'v', 81)

set complete=.,w,b,u,U,i,d,t
set completeopt=menu,longest

set showmatch
set showcmd

set splitbelow
set splitright

set wildmenu wildmode=longest:full
set wildoptions=tagfile
set wildignorecase

" Ignore a lot of stuff.
set wildignore+=*.swp,*.pyc,*.bak,*.class,*.orig
set wildignore+=.git,.hg,.bzr,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.svg
set wildignore+=build/*,tmp/*,vendor/cache/*,bin/*
set wildignore+=.sass-cache/*

set spelllang=en_us
set spellsuggest=best,3

" White spacing and Characters
" A problem that plagued me for months, having visual cues for white spacing
" solves formatting problems a lot quicker. Also, we're using modern shells
" (right?) so using UTF-8 characters for symbols should be a given.
set fillchars+=diff:⣿
set fillchars+=vert:│
set fillchars+=fold:-

" A visual cue for line-wrapping.
set showbreak=↪

" Visual cues when in 'list' model.
set list
" set listchars+=eol:¬
set listchars=
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=trail:⋅
set listchars+=nbsp:⋅
set listchars+=tab:\|\

set pastetoggle=<F2>
nnoremap <silent> <F2> setlocal paste!<cr>

nnoremap <silent> <bs> :setlocal hlsearch!<cr>

nnoremap <silent> <up>    <nop>
nnoremap <silent> <down>  <nop>
nnoremap <silent> <left>  <nop>
nnoremap <silent> <right> <nop>

nnoremap \\\ :Autoformat<CR><CR>

augroup files
  au!
  au BufWritePost * Neomake
augroup END
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :silent! g/^\_$\n\_^$/d

set background=dark
