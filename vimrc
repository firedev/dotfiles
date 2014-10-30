let bundle = "~/.vimrc.bundle" " So I can easily gf
" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker nospell:

" }
" Map <Leader> to ,
let mapleader = " "
let g:mapleader = " "
" Use bundles config {
if filereadable(expand(bundle))
    source ~/.vimrc.bundle
endif
" }

" SETTINGS {{{
if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

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
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set nospell                           " Spell checking off
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator

" Persistent undo
set history=1000
set undofile
set undodir=~/.vim/undo//

" No backup or swap
set nobackup
set noswapfile
set nowb

" Windows and splits
set hidden                          " Allow buffer switching without saving
set splitbelow
set splitright
set winminheight=0
set winminwidth=0
set diffopt+=vertical

" disable sounds
set noerrorbells
set novisualbell
set t_vb=

" See invisibles
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

set cursorline
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline

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
hi CursorLine ctermbg=black
hi CursorLineNr ctermbg=black ctermfg=yellow cterm=bold
hi LineNr ctermbg=black
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
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
" map <C-n> :cn<CR>
" map <C-p> :cp<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WINDOWS / SPLITS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>d :bd<CR>  " delete buffer
map <leader>D :bd!<CR> " force delete buffer
" nmap Q :qa!<CR>        " force quit
nmap <leader>c <Plug>Kwbd

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

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
