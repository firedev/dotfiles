"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE START
" https://github.com/gmarik/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" SnipMate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
" Optional:
Bundle 'honza/vim-snippets'

" Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
" Plugin 'bling/vim-bufferline'
Plugin 'edkolev/tmuxline.vim'

" Plugin 'kana/vim-fakeclip'
" Plugin 'wincent/Command-T'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'AndrewRadev/switch.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'szw/vim-tags'
Plugin 'tomtom/tcomment_vim'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/ctags.vim'
" Plugin 'majutsushi/tagbar'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BEHAVIOUR
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab           " Change TABS to SPACES
set tabstop=2
set shiftwidth=2
set softtabstop=2       " when hitting <BS>, pretend like a tab is removed, even if spaces
set autoindent          " always set autoindenting on
set smartindent
set copyindent          " copy the previous indentation on autoindenting
set number              " always show line numbers
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,
set mouse=a             " Use mouse
" set clipboard=unnamed   " Use system clipboard
set backspace=indent,eol,start " Backspace over everything
set nowrap              " Disable Wrap
set showcmd             " Show (partial) command in the status line
set showmatch           " See matching brackets
set matchtime=1
set autoread            " Autoread
set autowriteall           " Save on buffer switch
set timeout
set timeoutlen=600
set ttimeoutlen=1

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=longest:full,full
set wildignore+=.git,vendor/gems/*,*.png,*.PNG,*.JPG,*.jpg,*.GIF,*.gif,vendor/**,coverage/**,tmp/**,rdoc/**"
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
set nowb

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
augroup END

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?

  autocmd FileType php setlocal sw=4 sts=4 tabstop=4 noet

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


" Remap ; to :
nnoremap ; :

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Disable arrow keys
" inoremap  <Up>     <NOP>
" inoremap  <Down>   <NOP>
" inoremap  <Left>   <NOP>
" inoremap  <Right>  <NOP>
noremap   <Up>     :resize +5<cr>
noremap   <Down>   :resize -5<cr>
noremap   <Left>   :vertical resize -5<cr>
noremap   <Right>  :vertical resize +5<cr>

" Removing escape
ino kk <esc>
ino jj <esc>
cno jj <c-c>
cno kk <c-c>
vno v <esc>

" Auto change directory to match current file ,cd
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Strip trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COPY AND PASTE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F2>

" Stay at the bottom line after visual yank
vno y ygv<esc>

" Yank till the end of line
nnoremap Y y$

" Jump to the end of paste
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Quickly select text you just pasted:
noremap gV `[v`]

" System clipboard
nmap <Leader>yy "+yy
nmap <Leader>dd "+dd
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Type 12<Enter> to go to line 12 (12G breaks my wrist)
" Hit Enter to go to end of file.
" Hit Backspace to go to beginning of file.
" nnoremap <CR> G
" nnoremap <BS> gg


" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Indentation
vmap > >gv
vmap < <gv

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
" map <C-n> :cn<CR>
" map <C-p> :cp<CR>

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" SYNTAX HIGHLIGHTING
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
set background=dark

" Configs to make Molokai look great
let g:molokai_original=1
let g:rehash256=1
" colorscheme molokai
" colorscheme solarized
colorscheme Tomorrow-Night

"Custom colors
hi CursorLine ctermbg=black

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WINDOWS / SPLITS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" Buffer switching
" map <leader>p :bp!<CR> " \p previous buffer
" map <leader>n :bn!<CR> " \n next buffer
map <leader>d :bd<CR> " \d delete buffer

" A buffer becomes hidden when it is abandoned
set hid

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AIRLINE
set laststatus=2
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
let g:tmuxline_powerline_separators = 0
"" airline settings
" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_alt_sep=''
" remove unused modes
let g:airline_enable_fugitive=1
let g:airline_enable_syntastic=1
" set second section to filename
" let g:airline_section_b="%f"
" empty third and fourth sections
" let g:airline_section_c=""
" let g:airline_section_x=""
" put filetype in fifth section
" let g:airline_section_y="%Y"

" edkolev/tmuxline.vim
" let g:tmuxline_preset = 'tmux'
" let g:tmuxline_separators = {
"   \ 'left' : '',
"   \ 'left_alt': '',
"   \ 'right' : '',
"   \ 'right_alt' : '',
"   \ 'space' : ' '}
" " \ 'left_alt': '',
" " \ 'right_alt' : '',
" let g:tmuxline_preset='jellybeans'
" Disable plugin since config was generated and stored in .tmux.conf
let g:airline#extensions#tmuxline#enabled=0

" tpope/vim-fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>

" CTRLP
" kien/ctrlp.vim
" let g:ctrlp_user_command='git --git-dir=%s/.git ls-files -oc --exclude-standard'
" let g:ctrlp_working_path_mode=0
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_custom_ignore = '\v[\/](cache|cached)|(\.(swp|ico|git|svn))$'

nnoremap <leader>o :CtrlP<cr>
nnoremap <leader>ef :CtrlP<cr>
nnoremap <leader>er :CtrlPMRUFiles<cr>
nnoremap <leader>eb :CtrlPBuffer<cr>

" Command t
let g:CommandTMaxHeight=50
let g:CommandTMatchWindowAtTop=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTASTIC
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "⚠"
let g:syntastic_always_populate_loc_list = 1

" Fakeclip
let g:fakeclip_terminal_multiplexer_type = "tmux"

" Ruby Object
runtime macros/matchit.vim

" scrooloose/nerdtree
" let NERDTreeQuitOnOpen=1
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nc :NERDTreeCWD<cr>

" GitGutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guibg=bg
highlight GitGutterDelete ctermfg=red guibg=bg
highlight GitGutterChange ctermfg=yellow guibg=bg
highlight GitGutterChangeDelete ctermfg=yellow guibg=bg

" Expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Ctags
" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

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
" https://github.com/r00k/dotfiles/blob/master/vimrc
" https://github.com/mddubs/dotfiles/blob/master/vimrc
" https://github.com/joom/vim-starter/blob/master/vimrc
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" https://github.com/amix/vimrc
"
