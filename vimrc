set encoding=utf-8 nobomb
let mapleader = " "
let g:mapleader = " "

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'edkolev/tmuxline.vim'
let g:tmuxline_powerline_separators = 0
Plug 'vim-scripts/camelcasemotion'
Plug 'scrooloose/syntastic'
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "≈"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 3

Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'vim-ruby/vim-ruby'
" Plug 'henrik/vim-yaml-flattener'
Plug 'ecomba/vim-ruby-refactoring'

" Editing
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab' ",  { 'on': '<Plug>SuperTab' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'maxbrunsfeld/vim-yankstack'
let g:splitjoin_ruby_hanging_args = 0
Plug 'mattn/emmet-vim'

Plug 'AndrewRadev/switch.vim'
Plug 'sjl/vitality.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'low-ghost/nerdtree-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'rking/ag.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'rizzatti/dash.vim'
Plug 'gregsexton/gitv'

" Tpope
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'thoughtbot/vim-rspec'

call plug#end()

"###############################################################################
" ----------------------------------------------------------------------------
" NERDTREE
" ----------------------------------------------------------------------------
let g:NERDTreeQuitOnOpen=1
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nc :NERDTreeCWD<cr>

" ----------------------------------------------------------------------------
" fzf
" ----------------------------------------------------------------------------
set rtp+=~/.fzf
nnoremap <silent> <c-p> :FZF -m<CR>

" nnoremap <silent> <Leader>s :call fzf#run({ 'tmux_height': winheight('.') / 2, 'sink': 'botright split' })<CR>
" nnoremap <silent> <Leader>v :call fzf#run({ 'tmux_width': winwidth('.') / 2, 'sink': 'vertical botright split' })<CR>

function! BufList()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! BufOpen(e)
  execute 'buffer '. matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':      reverse(BufList()),
\   'sink':        function('BufOpen'),
\   'options':     '+m',
\   'tmux_height': '40%'
\ })<CR>

" nnoremap <silent> <Leader>C :call fzf#run({
" \   'source':
" \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
" \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
" \   'sink':       'colo',
" \   'options':    '+m',
" \   'tmux_width': 20,
" \   'launcher':   'xterm -geometry 20x30 -e bash -ic %s'
" \ })<CR>

function! s:tmux_words(query)
  let g:_tmux_q = a:query
  let matches = fzf#run({
  \ 'source':      'tmuxwords.rb --all-but-current --scroll 500 --min 5',
  \ 'sink':        function('Tmux_feedkeys'),
  \ 'options':     '--no-multi --query='.a:query,
  \ 'tmux_height': '40%'
  \ })
endfunction

function! Tmux_feedkeys(data)
  echom empty(g:_tmux_q)
  execute "normal! ".(empty(g:_tmux_q) ? 'a' : 'ciW')."\<C-R>=a:data\<CR>"
  startinsert!
endfunction

inoremap <silent> <C-X><C-T> <C-o>:call <SID>tmux_words(expand('<cWORD>'))<CR>

" ----------------------------------------------------------------------------
" JSX
" ----------------------------------------------------------------------------
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" " CTRLP
" call ctrlp_bdelete#init()
" let g:ctrlp_map = '<c-p><c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" nnoremap <c-p>t :CtrlPTag<cr>
" nnoremap <c-p>r :CtrlPMRUFiles<cr>
" nnoremap <c-p>b :CtrlPBuffer<cr>
" nnoremap <c-p><c-t> :CtrlPTag<cr>
" nnoremap <c-p><c-r> :CtrlPMRUFiles<cr>
" nnoremap <c-p><c-b> :CtrlPBuffer<cr>
" hi def link CtrlPMatch CursorLine
" let g:ctrlp_clear_cache_on_exit = 0
" let g:ctrlp_switch_buffer = 'Et'
" let g:ctrlp_custom_ignore = {
"       \ 'dir':  '\.git\|node_modules\|bin\|\.hg\|\.svn\|build\|log\|resources\|coverage\|doc\|tmp\|public/assets\|vendor\|Android',
"       \ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
"       \ }
" nnoremap <C-b> :CtrlPBuffer<cr>
" let g:ctrlp_extensions = ['funky']
" let g:ctrlp_funky_multi_buffers = 1
" nnoremap <Leader>fu :CtrlPFunky<Cr>
" " narrow the list down with a word under cursor
" nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Plugin 'tpope/vim-vinegar'
nmap <C-e> <Plug>VinegarVerticalSplitUp

" Plug 'bling/vim-airline'
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

" Plug 'rking/ag.vim' "{
" let g:agprg='true ; f(){ ag --column "$@" \| cut -c 1-'.(160).' }; f'

" Plug 'vim-scripts/camelcasemotion'
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

" vim-jsbeautify
" map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" SETTINGS
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

syntax enable
syntax sync fromstart

set regexpengine=1
set guioptions-=L
set guioptions-=r
set linebreak
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
" Time out on key codes but not mappings
set notimeout
set ttimeout
set ttimeoutlen=100

set showfulltag
set cursorline          " Highlight cursorline
" set scrolloff=3         " Set lines to the cursor - when moving vertically using
" set scrolljump=5        " Show 5 lines when jumping out of the window

set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set nospell                           " Spell checking off
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set history=1000
set undofile                    " Save undo's after file closes
set undodir=~/.vim/undo         " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo
if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif
set nobackup
set noswapfile
set nowb
set hidden                          " Allow buffer switching without saving
set splitbelow
set splitright
set winminheight=0
set winminwidth=0
set diffopt+=vertical
set nojoinspaces                    " No double space after dot when J
set noerrorbells
set novisualbell
set t_vb=
set listchars=tab:›\ ,trail:⋅,nbsp:~,extends:❯,precedes:❮
set list
set exrc                            " Local .vimrc
set nostartofline

" Searching
set hlsearch
set incsearch
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,

" Tab completion
set wildignore+=.DS_Store,vim/undo/**,/var/folders/**,vendor/gems/*,*.png,*.PNG,*.JPG,*.jpg,*.GIF,*.gif,vendor/**,coverage/**,tmp/**,rdoc/**"

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,*.rbc,*.rbo,*.class,.svn,*.gem

" Ignore images and log files
set wildignore+=*.gif,*.jpg,*.png,*.log

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Ignore custom folders
set wildignore+=*/resources/*

" Ignore node modules
set wildignore+=node_modules/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Disable osx index files
set wildignore+=.DS_Store
set wildmode=longest:full,full " best way
set wildmenu
set wildignorecase

" UI CONFIGURATION
set t_Co=256
set lazyredraw
set noshowcmd             " Show (partial) command in the status line
set showmatch           " See matching brackets
set matchtime=1         " Blink them quickly
set number
set norelativenumber
set laststatus=2
set noshowmode

set foldmethod=indent
set foldlevel=1
set foldnestmax=10
" Open all folds by default
set nofoldenable

" set nofoldenable                                      "enable folds by default
" set foldmethod=syntax                               "fold via syntax of files
" set foldlevelstart=99                               "open all folds by default
" let g:xml_syntax_folding=1                          "enable xml folding

" set cursorline
" autocmd WinLeave * setlocal nocursorline
" autocmd WinEnter * setlocal cursorline

" AUTOCOMMANDS
command! Reload source ~/.vimrc
au! BufWritePost .vimrc source %
au! BufWritePost vimrc :Reload
autocmd BufLeave,FocusLost * silent! update

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

  " Some file types use real tabs
  au FileType {make,gitconfig} set noexpandtab sw=4

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json setf javascript

  " Make Python follow PEP8
  au FileType python set sts=4 ts=4 sw=4 tw=79

  " Make sure all markdown files have the correct filetype
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

  " MultiMarkdown requires 4-space tabs
  au FileType markdown set sts=4 ts=4 sw=4
augroup END

" Strip trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :silent! g/^\_$\n\_^$/d
autocmd BufReadPost fugitive://* set bufhidden=delete

" SYNTAX HIGHLIGHTING
syntax on
set background=dark
" let g:seoul256_background = 235
" color seoul256
colorscheme Tomorrow-Night
" Plug 'airblade/vim-gitgutter' "{
let g:gitgutter_override_sign_column_highlight = 0
highlight GitGutterAdd ctermfg=green
highlight GitGutterDelete ctermfg=red
highlight GitGutterChange ctermfg=yellow
highlight GitGutterChangeDelete ctermfg=yellow
let g:gitgutter_realtime = 0

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
" let g:indent_guides_color_change_percent = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
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
au BufEnter *.rb syn match error contained "\<byebug\>"
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

" KEYBOARD
nnoremap <c-g> 1<c-g>
" LEADER {

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
" }

nnoremap - :Switch<cr>

" Ctrl-J - insert line under cursor
inoremap <c-j> <esc>o
" Better splits
" nnoremap <C-W>s Hmx`` \|:split<CR>`xzt``

" Better C-a C-x
" function! NextNum()
"   let ch = getline(".")[col(".")-1]
"   if ch !~ "[0-9]"
"     execute "normal! /[0-9]\<cr>"
"   endif
" endfunction

" nnoremap <c-a> :call NextNum()<cr>m`lv$xh<c-a>p``
" nnoremap <c-x> :call NextNum()<cr>m`lv$xh<c-x>p``

" nnoremap <C-a> :call search('\d', 'c')<CR>a <Esc>h<C-a>lxh
" nnoremap <C-x> :call search('\d', 'c')<CR>a <Esc>h<C-x>lxh
fun! Add(amount)
    " No number on this line
    if !search('\d', 'c', line('.')) | return | endif

    " Get the number of the character under the cursor
    let l:nr = str2nr(getline('.')[col('.') - 1])

    " 9 -> Wrap to 0
    if a:amount > 0 && l:nr == 9
        normal! r0
    " 0 -> Wrap to 9
    elseif a:amount < 0 && l:nr == 0
        normal! r9
    " Add amount
    else
        execute "normal! r" . (l:nr + a:amount)
    endif
endfun
nnoremap <C-a> :call Add(1)<Cr>
nnoremap <C-x> :call Add(-1)<Cr>

" Quick write
nmap <leader>w :w!<cr>
" Quick quit
nmap <leader>q :q<cr>
" Quick reindent
nmap === mrgg=Gg`rzz

" screen line scroll
map <silent> j gj
map <silent> k gk

" Removing escape
" ino kj <esc>
" cno kj <c-c>
" ino jk <esc>
" cno jk <c-c>
" ino kk <esc>
" ino jj <esc>
" cno jj <c-c>
" cno kk <c-c>

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

" Expand %% to current directory
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%')<cr>

" Indentation
vmap > >gv
vmap < <gv

" folds
nnoremap zr zr:echo &foldlevel<cr>
nnoremap zm zm:echo &foldlevel<cr>
nnoremap zR zR:echo &foldlevel<cr>
nnoremap zM zM:echo &foldlevel<cr>

" auto center
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz

" RSpec.vim mappings
let g:rspec_command = "Dispatch rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" shortcuts for windows
" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
" map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
" map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
" map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
" nnoremap <leader>vsa :vert sba<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <C-h> <esc><C-w>h
inoremap <C-j> <esc><C-w>j
inoremap <C-k> <esc><C-w>k
inoremap <C-l> <esc><C-w>l

" Useful mappings for managing tabs
" map <leader>tn :tabnew<cr>
" map <leader>to :tabonly<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove

" Let 'tl' toggle between this and the last accessed tab
" let g:lasttab = 1
" nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
" au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
" map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" make Y consistent with C and D. See :help Y.
nnoremap Y y$

" window killer
nmap Q :qa!<CR>        " force quit
" nnoremap <silent> Q :call CloseWindowOrKillBuffer()<cr>

" quick buffer open
nnoremap gb :ls<cr>:e #
" quick close
" nnoremap <C-c> :bnext\|bdelete #<CR>
nnoremap <C-c> :enew\|bdelete #<CR>
" nnoremap <C-c> :bdelete<CR>
inoremap <C-c> <Esc>

nnoremap <BS> :set hlsearch! hlsearch?<cr>:redraw!<cr>:set hlsearch?<cr>

" System clipboard
set pastetoggle=<F2>
nmap <Leader>yy "+yy
nmap <Leader>dd "+dd
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COPY AND PASTE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap W! w !sudo tee > /dev/null %
nnoremap <leader>V :e $MYVIMRC<cr>

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
" map <C-s> <esc>:w<CR>
" inoremap <C-s> <esc>:w<CR>
" map <C-t> <esc>:tabnew<CR>
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
" set viminfo=!,'20,<50,s10,h

function! CloseWindowOrKillBuffer() "
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
endfunction

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

" Inspiration
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
