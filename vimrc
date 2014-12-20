" vim: foldmethod=marker fmr={,} foldlevel=1

let mapleader = " "
let g:mapleader = " "

" Vundle Start {
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
" Snippets and completion {
" Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'asux/vim-capybara.git'
Plugin 'Keithbsmiley/rspec.vim'
" }
" Colors, indents, airline, tmuxline {
Plugin 'bling/vim-airline' "{
" bling/vim-airline
" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_alt_sep=''
let g:airline_section_y='' " Remove encoding and newline
" enable/disable showing only non-zero hunks.
let g:airline#extensions#hunks#non_zero_only=1
" because of TmuxlineSnapshot
let g:airline#extensions#tmuxline#enabled=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#close_symbol = '✖'
"}
Plugin 'airblade/vim-gitgutter' "{
" highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guibg=bg
highlight GitGutterDelete ctermfg=red guibg=bg
highlight GitGutterChange ctermfg=yellow guibg=bg
highlight GitGutterChangeDelete ctermfg=yellow guibg=bg
let g:gitgutter_realtime = 0
"}
" Plugin 'Yggdroot/indentLine' "{
" let g:indentLine_char="┆"
" "}

Plugin 'nathanaelkane/vim-indent-guides' "{
let g:indent_guides_color_change_percent = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
"}

Plugin 'flazz/vim-colorschemes'
Plugin 'edkolev/tmuxline.vim' "{
let g:tmuxline_powerline_separators = 0
"}
"}
" }

" Text objects {
Plugin 'vim-scripts/camelcasemotion' "{
" Camelcasemotion
map w <Plug>CamelCaseMotion_w
map b <Plug>CamelCaseMotion_b
map e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
nmap cw ce
omap iw ie
xmap iw ie
omap iw <Plug>CamelCaseMotion_iw
xmap iw <Plug>CamelCaseMotion_iw
omap ib <Plug>CamelCaseMotion_ib
xmap ib <Plug>CamelCaseMotion_ib
omap ie <Plug>CamelCaseMotion_ie
xmap ie <Plug>CamelCaseMotion_ie
"}
Plugin 'beloglazov/vim-textobj-quotes'  " Closest quotes              aq / iq {
" beloglazov/vim-textobj-quotes
xmap q iq
omap q iq
" Now, you just need to press cq, dq, yq, or vq to operate on the text in single
" ('), double ("), or back (`) quotes nearby without manually moving into them.
" }
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'        " Entire dociment             ae / ie
Plugin 'kana/vim-textobj-indent'        " Indent block                ai / ii / aI / iI
Plugin 'Julian/vim-textobj-brace'       " Any parens                  aj / ij
Plugin 'glts/vim-textobj-comment'       " Comment                     ac / ic
Plugin 'tek/vim-textobj-ruby'           " .rb Block, Class, Fun, Name ab / ac / af / an
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'henrik/vim-yaml-flattener'
" }

" Lanugage Syntax {
Plugin 'scrooloose/syntastic' "{
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "≈"
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_aggregate_errors = 1
" When set to 2 the cursor will jump to the first issue detected, but only if
" this issue is an error. >
" let g:syntastic_auto_jump = 2
" When set to 1 the error window will be automatically opened when errors are
" detected, and closed when none are detected. >
" let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 3
" }
Plugin 'kchmck/vim-coffee-script'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'slim-template/vim-slim'
Plugin 'vim-ruby/vim-ruby'
" }

" Editing {
" Plugin 'godlygeek/tabular.git'
Plugin 'AndrewRadev/splitjoin.vim' " {
let g:splitjoin_ruby_hanging_args = 0
" }
Plugin 'AndrewRadev/switch.vim' "{
nnoremap - :Switch<cr>
"}
" Plugin 'vim-scripts/simplefold'
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'terryma/vim-expand-region'
" }

" Tmux {
Plugin 'sjl/vitality.vim'
" Plugin 'benmills/vimux' "{
" " Vimux
" " Prompt for a command to run
" map <leader>vr :VimuxPromptCommand<cr>
" map <leader>vx :VimuxCloseRunner<cr>
" "}
Plugin 'christoomey/vim-tmux-navigator'
" }

" Navigation and autocompletion {
Plugin 'scrooloose/nerdtree' "{
" scrooloose/nerdtree
" let NERDTreeQuitOnOpen=1
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nc :NERDTreeCWD<cr>
" }
Plugin 'kien/ctrlp.vim' "{
" kien/ctrlp.vim
" let g:ctrlp_user_command='git --git-dir=%s/.git ls-files -oc --exclude-standard'
" let g:ctrlp_working_path_mode=0
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
let g:ctrlp_map = '<c-p><c-p>'
let g:ctrlp_cmd = 'CtrlP'

nnoremap <c-p>t :CtrlPTag<cr>
nnoremap <c-p>r :CtrlPMRUFiles<cr>
nnoremap <c-p>b :CtrlPBuffer<cr>
nnoremap <c-p><c-t> :CtrlPTag<cr>
nnoremap <c-p><c-r> :CtrlPMRUFiles<cr>
nnoremap <c-p><c-b> :CtrlPBuffer<cr>
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
"}

Plugin 'xolox/vim-easytags' " {
Plugin 'xolox/vim-misc'
let g:easytags_async = 1
" }

" Plugin 'majutsushi/tagbar' " {
" nmap <leader>] :TagbarToggle<CR>
" " }
Plugin 'rking/ag.vim' "{
let g:agprg='true ; f(){ ag --column "$@" \| cut -c 1-'.(160).' }; f'
"}
Plugin 'rizzatti/dash.vim'
Plugin 'gregsexton/gitv'
Plugin 'rgarver/Kwbd.vim'
"}

" Tpope {
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-endwise'
" }

" vindle#end {
call vundle#end()            " required
filetype plugin indent on    " required
"}

" SETTINGS {{{
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

set guioptions-=L
set guioptions-=r
set expandtab           " Change TABS to SPACES
set tabstop=2           " 2 Spaces
set shiftwidth=2        "
set softtabstop=2       " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftround          " Round to the nearest tabstop
set autoindent          " always set autoindenting on
set smartindent
set copyindent          " copy the previous indentation on autoindenting
set mouse=a             " Use mouse
set backspace=indent,eol,start " Backspace over everything
set nowrap              " Disable Wrap
set formatoptions=q     " Allow gq on a long line
set autoread            " Auto read
set autowrite
set autowriteall        " Save on buffer switch
set timeout
set timeoutlen=300
set ttimeoutlen=50
set showfulltag
set cursorline          " Highlight cursorline
set scrolloff=3         " Set lines to the cursor - when moving vertically using
set scrolljump=5        " Show 5 lines when jumping out of the window

set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set nospell                           " Spell checking off
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set history=1000
set undofile
set undodir=~/.vim/undo//
set nobackup
set noswapfile
set nowb
set hidden                          " Allow buffer switching without saving
set splitbelow
set splitright
set winminheight=0
set winminwidth=0
set diffopt+=vertical

set noerrorbells
set novisualbell
set t_vb=
set listchars=tab:›\ ,trail:⋅,nbsp:~,extends:❯,precedes:❮
set list

" Searching
set hlsearch
set incsearch
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,

" Tab completion
set wildignore+=.DS_Store,vim/undo/**,/var/folders/**,.git/**,vendor/gems/*,*.png,*.PNG,*.JPG,*.jpg,*.GIF,*.gif,vendor/**,coverage/**,tmp/**,rdoc/**"
set wildmode=list:longest,list:full
set wildmenu
set wildignorecase
" }}}

" UI CONFIGURATION {{{
set t_Co=256
set ttyfast
set lazyredraw
set showcmd             " Show (partial) command in the status line
set showmatch           " See matching brackets
set matchtime=1         " Blink them quickly
set number
set laststatus=2
set noshowmode
set foldenable                                      "enable folds by default
set foldmethod=syntax                               "fold via syntax of files
set foldlevelstart=99                               "open all folds by default
let g:xml_syntax_folding=1                          "enable xml folding

" set cursorline
" autocmd WinLeave * setlocal nocursorline
" autocmd WinEnter * setlocal cursorline

" }}}

" AUTOCOMMANDS {{{
command! Reload source ~/.vimrc
au! BufWritePost .vimrc source %
au! BufWritePost vimrc :Reload

augroup vimrc
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
  " Allow stylesheets to autocomplete hyphenated words
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
  autocmd FileType php setlocal sw=4 sts=4 tabstop=4 noet
  autocmd FileType css,scss,sass setlocal iskeyword+=-
  autocmd FileType vim setlocal fdm=indent
augroup END

" Strip trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :silent! g/^\_$\n\_^$/d
" }}}

" SYNTAX HIGHLIGHTING {{{
syntax on
colorscheme Tomorrow-Night

hi GroupA ctermfg=darkgray
hi GroupB ctermfg=darkgray
match GroupA / \+$/
2match GroupB /\t/

"Custom colors
hi SpellBad ctermbg=darkgrey
hi SpellCap ctermbg=darkgrey
hi CursorLine ctermbg=black
hi CursorLineNr ctermbg=black ctermfg=yellow cterm=bold
hi LineNr ctermbg=black
hi IndentGuidesEven ctermbg=black
hi IndentGuidesOdd ctermbg=bg
autocmd VimEnter,BufEnter,WinEnter * call MyColors()
function! MyColors()
  let &nuw=len(line('$'))+2
  call matchadd('CursorLineNr', '\%81v')  "1111111111111111111111111111111111111111111111
  call matchadd('ErrorMsg', '.*xx.*')   " xx
  call matchadd('DiffAdd', '.*vv.*')    " vv
  call matchadd('Search', '.*??.*')     " ??
endfunction
"}}}

" KEYBOARD {{{

" LEADER {
map <leader>a: :Tab/\w:   \zs/l0l1<cr>
map <leader>a: : :Tab/\w: \zs/r0l1l0<cr>

map <leader>d :bd<CR>  " delete buffer
map <leader>D :bd!<CR> " force delete buffer
" nmap Q :qa!<CR>        " force quit
nmap <leader>c <Plug>Kwbd

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nmap <leader>] :TagbarToggle<CR>
" }

nnoremap - :Switch<cr>

" Ctrl-J - insert line under cursor
inoremap <c-j> <esc>o

" Quick write
nmap <leader>w :w!<cr>
" Quick quit
nmap <leader>q :q<cr>
" Quick reindent
nmap === mrgg=Gg`r

" screen line scroll
nnoremap <silent> j gj
nnoremap <silent> k gk

" Removing escape
ino kj <esc>
cno kj <c-c>
ino jk <esc>
cno jk <c-c>
ino kk <esc>
ino jj <esc>
cno jj <c-c>
cno kk <c-c>

" Auto change directory to match current file ,cd
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Stay at the bottom line after visual yank
vno y ygv<esc>

" Yank till the end of line
nnoremap Y y$

" Quickly select text you just pasted:
noremap gV `[v`]
" reselect last paste
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Indentation
vmap > >gv
vmap < <gv

" change cursor position in insert mode
" inoremap <C-h> <left>
" inoremap <C-l> <right>

" command-line window {{{
nnoremap q: q:i
nnoremap q/ q/i
nnoremap q? q?i
" }}}

" folds {{{
nnoremap zr zr:echo &foldlevel<cr>
nnoremap zm zm:echo &foldlevel<cr>
nnoremap zR zR:echo &foldlevel<cr>
nnoremap zM zM:echo &foldlevel<cr>
" }}}

" auto center {{{
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz
"}}}

" shortcuts for windows {{{
" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
nnoremap <leader>vsa :vert sba<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <C-h> <esc><C-w>h
inoremap <C-j> <esc><C-w>j
inoremap <C-k> <esc><C-w>k
inoremap <C-l> <esc><C-w>l
"}}}

" Useful mappings for managing tabs {{{
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" }}}

" make Y consistent with C and D. See :help Y.
nnoremap Y y$

" hide annoying quit message
nnoremap <C-c> <C-c>:echo<cr>

" window killer
nmap Q :qa!<CR>        " force quit
" nnoremap <silent> Q :call CloseWindowOrKillBuffer()<cr>

" quick buffer open
nnoremap gb :ls<cr>:e #

nnoremap <BS> :set hlsearch! hlsearch?<cr>:redraw!<cr>:set hlsearch?<cr>

" System clipboard {{{
set pastetoggle=<F2>
nmap <Leader>yy "+yy
nmap <Leader>dd "+dd
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
"}}}

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COPY AND PASTE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap W! w !sudo tee > /dev/null %

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
inoremap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
" map <C-n> :cn<CR>
" map <C-p> :cp<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WINDOWS / SPLITS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify the behavior when switching between buffers
set switchbuf=useopen,usetab ",newtab

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Remember info about open buffers on close
set viminfo^=%

function! CloseWindowOrKillBuffer() "{{{
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

  " never bdelete a nerd tree
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif

  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction "}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" mkitt/tabline.vim
let g:bufferline_echo = 0

" edkolev/tmuxline.vim
let g:tmuxline_preset = 'minimal'
let g:tmuxline_theme = 'airline'

" gregsexton/gitv
nnoremap <leader>gv :Gitv<cr>

" Expand region
vmap v <Plug>(expand_region_expand
vmap <C-v> <Plug>(expand_region_shrink)
nnoremap gp `[v`] " select region just pasted

nmap <silent> K <Plug>DashSearch

runtime macros/matchit.vim

" Inspiration {{{
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
" https://github.com/bling/dotvim
" }}}
