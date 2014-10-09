set encoding=utf-8
source ~/dotfiles/bundles.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BEHAVIOUR
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab           " Change TABS to SPACES
set tabstop=2
set shiftwidth=2
set softtabstop=2       " when hitting <BS>, pretend like a tab is removed, even if spaces
set autoindent          " always set autoindenting on
set copyindent          " copy the previous indentation on autoindenting
set number              " always show line numbers
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,
set mouse=a             " Use mouse
set clipboard=unnamed   " Use system clipboard
set backspace=indent,eol,start " Backspace over everything
set nowrap              " Disable Wrap
set showcmd             " Show (partial) command in the status line
set showmatch           " See matching brackets
set matchtime=1
set autoread            " Autoread
set autowrite           " Save on buffer switch
set timeout timeoutlen=200 ttimeoutlen=100
" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set pastetoggle=<F2>
" Tab completion
set wildmode=longest:full,full
set wildignore+=.git,vendor/gems/*

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Automatically reload .vimrc on save
command! Reload source ~/.vimrc
au! BufWritePost .vimrc source %
au! BufWritePost bundles.vim :Reload
au! BufWritePost vimrc :Reload

" Highlight matches when jumping to next
nnoremap <silent> n n:call HLNext(0.5)<cr>
nnoremap <silent> N N:call HLNext(0.5)<cr>

" Blink the matching line
function! HLNext (blinktime)
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 100) . 'm'
  set invcursorline
  redraw
endfunction

" Persistent undo
set undofile
set undodir=~/.vim/undo//
" No backup or swap
set nobackup
set noswapfile

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBOARD
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Leader> to ,
let mapleader = " "
let g:mapleader = " "

" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>
" Quick write
nmap <leader>w :w!<cr>
" Quick quit
nmap <leader>q :q<cr>
" Quick reindent
nmap === mrgg=Gg`r

" Buffer switching
" map <leader>p :bp!<CR> " \p previous buffer
" map <leader>n :bn!<CR> " \n next buffer
map <leader>d :bd<CR> " \d delete buffer

" Remap ; to :
nnoremap ; :

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Removing escape
ino jj <esc>
cno jj <c-c>
vno v <esc>

" Auto change directory to match current file ,cd
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Strip trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Yank till the end of line
nnoremap Y y$

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Indentation
vmap > >gv
vmap < <gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX HIGHLIGHTING
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set t_Co=256

" Highlight 81st column
highlight ColorColumn ctermbg=darkgrey
call matchadd('ColorColumn', '\%81v', 100)

" See invisibles
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list
hi GroupA ctermfg=darkgray
hi GroupB ctermfg=darkgray
match GroupA / \+$/
2match GroupB /\t/

" highlight the current line
" set cursorline
" Highlight active column
" set cuc cul"
" colorscheme github
" Configs to make Molokai look great
set background=dark
let g:molokai_original=1
let g:rehash256=1
colorscheme molokai

"Custom colors
hi CursorLine ctermbg=black

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WINDOWS / SPLITS
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap vs :vsplit<cr>
nmap sp :split<cr>
nmap <C-v> :vertical resize +5<cr>
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AIRLINE
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_powerline_separators = 0
"" airline settings
" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''
" remove unused modes
let g:airline_enable_fugitive=1
let g:airline_enable_syntastic=1
" set second section to filename
let g:airline_section_b="%f"
" empty third and fourth sections
let g:airline_section_c=""
let g:airline_section_x=""
" put filetype in fifth section
let g:airline_section_y="%Y"
" let g:tmuxline_separators = {
"       \ 'left' : '',
"       \ 'left_alt': '',
"       \ 'right' : '',
"       \ 'right_alt' : '',
"       \ 'space' : ' '}
" " \ 'left_alt': '',
" " \ 'right_alt' : '',

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRLP
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_user_command='git --git-dir=%s/.git ls-files -oc --exclude-standard'
let g:ctrlp_working_path_mode=0
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTASTIC
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "⚠"

" Fakeclip
let g:fakeclip_terminal_multiplexer_type = "tmux"

" Ruby Object
runtime macros/matchit.vim

" NerdTree
nmap <leader>nt :NERDTreeFind<cr>
" GitGutter
"
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guibg=bg
highlight GitGutterDelete ctermfg=red guibg=bg
highlight GitGutterChange ctermfg=yellow guibg=bg
highlight GitGutterChangeDelete ctermfg=yellow guibg=bg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Inspiration
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/janjiss/rcfiles/blob/master/vim/vimrc
" https://gist.github.com/JeffreyWay/6753834
" https://github.com/tpope/tpope/blob/master/.vimrc
" https://github.com/thoughtbot/dotfiles/blob/master/vimrc
" https://github.com/gmarik/Vundle.vim/wiki/Examples
" https://github.com/tlhunter/vimrc/blob/master/vimrc
" https://github.com/nelstrom/dotfiles/blob/master/vimrc
" https://github.com/kshenoy/dotvim/blob/master/bundle.vim#L167-L187
" https://github.com/tsironis/maximum-awesome-squared
" https://github.com/livingsocial/ls-pair
"
