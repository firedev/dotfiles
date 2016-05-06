let mapleader=' '

call plug#begin('~/.config/nvim/plugged')

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

Plug 'ap/vim-css-color'

Plug 'AndrewRadev/vim-eco'

Plug 'AndrewRadev/switch.vim'
let g:switch_mapping = "-"

Plug 'AndrewRadev/splitjoin.vim'

Plug 'benekastah/neomake'
" let g:neomake_javascript_eslint_marker = {
"       \ 'args': ['--fix']
"       \ }
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_error_sign = {
      \ 'texthl': 'ErrorMsg',
      \ }
" let g:neomake_ft_jsx_enabled_makers = ['eslint']
" let g:neomake_open_list=2
" let g:neomake_list_height=1
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 3
" inoremap <silent><expr> <Tab>
" \ pumvisible() ? "\<C-n>" :
" \ deoplete#mappings#manual_complete()
function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
  let b:deoplete_disable_auto_complete = 0
endfunction

Plug 'Shougo/echodoc.vim'
set noshowmode
let g:echodoc_enable_at_startup = 1

Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

Plug 'easymotion/vim-easymotion'
nmap s <Plug>(easymotion-s)

Plug 'janko-m/vim-test'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>A :RSpec<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = 'neoterm'

" Plug '907th/vim-auto-save'
" let g:auto_save = 1
" let g:auto_save_in_insert_mode = 0
" Plug 'malept/vim-flog'
" silent exe "g:flog_enable"
" map <leader>f :call FlogToggle()<cr>
" Plug 'skammer/vim-ruby-complexity'

Plug 'szw/vim-tags'
let g:vim_tags_auto_generate = 0
" let g:vim_tags_use_vim_dispatch = 1
" Plug 'lukaszkorecki/CoffeeTags'

Plug 'majutsushi/tagbar'

Plug 'kassio/neoterm'
let g:neoterm_size = 10

Plug 'austintaylor/vim-indentobject'

Plug 'mattn/emmet-vim'

Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"

Plug 'edsono/vim-matchit'

Plug 'jreybert/vimagit'

Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdtree'

Plug 'junegunn/gv.vim'

Plug 'low-ghost/nerdtree-fugitive'

Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=red
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=black

Plug 'Xuyuanp/nerdtree-git-plugin'
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeHijackNetrw=0
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
" nnoremap <leader>nf :call NERDTreeToggleInCurDir()<cr>
nnoremap <leader>nc :NERDTreeCWD<cr>

Plug 'flazz/vim-colorschemes'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_alt_sep=''
let g:airline_inactive_collapse=1
let g:airline_section_y=''
" Remove encoding and newline
" enable/disable showing only non-zero hunks.
let g:airline#extensions#hunks#non_zero_only=1
" because of TmuxlineSnapshot
let g:airline#extensions#tmuxline#enabled=0
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#close_symbol = '✖'
" for FZF
let g:airline#extensions#branch#enabled = 0

Plug 'pangloss/vim-javascript'

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

Plug 'Chiel92/vim-autoformat'

Plug 'slim-template/vim-slim'

Plug 'mtscout6/vim-cjsx'

Plug 'kchmck/vim-coffee-script'

Plug 'rking/ag.vim'
ca Ag Ag!

Plug 'tpope/vim-dispatch'

Plug 'radenling/vim-dispatch-neovim'

Plug 'vim-ruby/vim-ruby'
let ruby_no_expensive = 1

Plug 'tpope/vim-rsi'

Plug 'tpope/vim-rails'

Plug 'tpope/vim-bundler'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-ragtag'
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-abolish'

Plug 'tpope/vim-fugitive'
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>

" Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>

" Mutliple cursors
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

Plug 'wellle/targets.vim'

" {{{ NeoSnippet
" Plug 'Shougo/neosnippet.vim'
" " Plugin key-mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"       \ "\<Plug>(neosnippet_expand_or_jump)"
"       \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"       \ "\<Plug>(neosnippet_expand_or_jump)"
"       \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" NeoSnippet-Snippets
Plug 'Shougo/neosnippet-snippets'

" Vim-Snippets
Plug 'honza/vim-snippets'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
nnoremap <silent> <c-p> :FZF -m<CR>

nnoremap <silent> <Leader>s :call fzf#run({ 'tmux_height': winheight('.') / 2, 'sink': 'botright split' })<CR>
nnoremap <silent> <Leader>v :call fzf#run({ 'tmux_width': winwidth('.') / 2, 'sink': 'vertical botright split' })<CR>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
call plug#end()

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set t_Co=256
set background=dark
colorscheme Tomorrow-Night

set guifont=PragmataPro:h13
set number
set relativenumber
set nowrap
set ruler
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set hidden
set noswapfile
set undodir=~/.vim/undo         " where to save undo histories
set undofile                    " Save undo's after file closes
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo
set nobackup
set nowritebackup
call matchadd('ColorColumn', '\%' . &textwidth . 'v', 81)
set nospell
set ignorecase
set smartcase

set complete=.,w,b,u,U,i,d,t
set completeopt=menu,longest
set conceallevel=0
set showmatch
" set showcmd
" set cursorline

set splitbelow
set splitright

" set wildmenu wildmode=longest:full
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
set listchars+=tab:·\ "

set pastetoggle=<F2>
noremap <silent> <F2> setlocal paste!<cr>

" nnoremap <silent> <bs> :setlocal hlsearch!<cr>

nnoremap <silent> <up>    <nop>
nnoremap <silent> <down>  <nop>
nnoremap <silent> <left>  <nop>
nnoremap <silent> <right> <nop>
nnoremap Q <nop>
nnoremap <F1> <ESC>
inoremap <F1> <ESC>
nnoremap <c-g> 1<c-g>

" Easy move between windows
func! s:mapMoveToWindowInDirection(direction)
  func! s:moveToDirection(direction)
    stopinsert
    execute "wincmd" a:direction
  endfunc
  execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
        \ "<C-\\><C-n>"
        \ ":call <SID>moveToDirection(\"" . a:direction . "\")<CR>"
  execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
        \ ":call <SID>moveToDirection(\"" . a:direction . "\")<CR>"
endfunc

for dir in ["h", "j", "l", "k"]
  call s:mapMoveToWindowInDirection(dir)
endfor

augroup files
  au!
  " au BufEnter * if &buftype == 'terminal' | highlight TermCursor ctermfg=red guifg=red | :startinsert | endif
  au BufEnter * if &buftype == 'terminal' | highlight TermCursor ctermfg=red guifg=red | endif
  au BufEnter * hi MatchParen ctermfg=yellow ctermbg=black
  au BufWritePost * Neomake
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  au FileType fzf tnoremap <nowait><buffer> <esc> <c-g>
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END
au! BufWritePost init.vim source %

autocmd BufWritePre *.md :%s//\r/ge
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :silent! g/^\_$\n\_^$/d

set background=dark

" screen line scroll
map <silent> j gj
map <silent> k gk

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap <leader><space> za
" Yank
" Yank till the end of line
nnoremap Y y$
" Quickly select text you just pasted:
noremap gV `[v`]

" nnoremap <cr> O<esc>

" System clipboard
set pastetoggle=<F2>
nmap <leader>yy "*yy
nmap <leader>dd "*dd
vmap <leader>y "*y
vmap <leader>Y "*y$
vmap <leader>d "*d
nmap <leader>p "*p
nmap <leader>P "*P
vmap <leader>p "*p
vmap <leader>P "*P

nmap <leader>[p O<Esc>"*P
nmap <leader>]p o<Esc>"*p

" Indentation
vmap > >gv
vmap < <gv
" noremap <Tab> mm^==`m<esc>
noremap <Tab> ^==<esc>

" auto center
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz

" Quick reindent
nmap === mrgg=Gg`rzz
" tnoremap <leader><esc> <C-\><C-n>
tnoremap <esc><esc> <C-\><C-n>

" Expand %% to current directory
" http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
cnoremap w!! %!sudo tee > /dev/null %
nnoremap <leader><leader> :b#<cr>
nnoremap <leader>w :w<cr>
nnoremap q: :q
