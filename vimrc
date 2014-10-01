let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>r gg=G

" Pathogen
execute pathogen#infect()

set encoding=utf-8

" Fix backspace
set backspace=indent,eol,start

" Fix clipboard
set clipboard=unnamed

" Line numbers
set number
highlight LineNr ctermfg=darkgrey

" Highlight search results
set hlsearch

" Persistent undo
set undofile
set undodir=~/.vim/undo/

" Highlight 81st column
highlight ColorColumn ctermbg=darkgrey
call matchadd('ColorColumn', '\%81v', 100)

" Syntax highlight
syntax on
filetype plugin indent on

" Automatically reload .vimrc on save
au! BufWritePost .vimrc source %

" Remap ; to :
nnoremap ; :

" https://github.com/Yggdroot/indentLine
let g:indentLine_char = '︙'
" let g:indentLine_char = '┆'

" Add an empty line when saving
function! AddLastLine()
  if getline('$') !~ "^$"
    call append(line('$'), '')
  endif
endfunction
autocmd BufWritePre * call AddLastLine()

" Strip trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" See invisibles
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list
hi GroupA ctermfg=darkgray
hi GroupB ctermfg=darkgray
match GroupA / \+$/
2match GroupB /\t/

"Change TABS to SPACES
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2 " when hitting <BS>, pretend like a tab is removed, even if spaces

"=====[ Highlight matches when jumping to next ]=============
nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

"=====[ Blink the matching line ]=============
function! HLNext (blinktime)
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 100) . 'm'
  set invcursorline
  redraw
endfunction


" NERDTree
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

"Q. How can I map a specific key or shortcut to open NERDTree?
map <C-n> :NERDTreeToggle<CR>

"Q. How can I close vim if the only window left open is a NERDTree?
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif



" CTRL-P
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
set t_Co=256

" Autoread
set autoread


" Jeffrey Way https://gist.github.com/JeffreyWay/6753834

set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set autowrite  "Save on buffer switch
set mouse=a


"Auto change directory to match current file ,cd
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Swap files out of the project root
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/

set nocompatible   " Disable vi-compatibility

" Show (partial) command in the status line
set showcmd

" Remove search results
command! H let @/=""

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Down is really the next line
nnoremap j gj
nnoremap k gk

" end Jeffrey Way

