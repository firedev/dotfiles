set encoding=utf-8 nobomb
let mapleader = " "
let g:mapleader = " "

source ~/dotfiles/vim-plugins.vimrc

" SETTINGS

syntax enable
syntax sync fromstart

set autoindent          " always set autoindenting on
set autoread            " Auto read
set autowrite
set autowriteall        " Save on buffer switch
set backspace=indent,eol,start " Backspace over everything
" set clipboard=unnamed
set copyindent          " copy the previous indentation on autoindenting
set cursorline          " Highlight cursorline
set diffopt+=vertical
set expandtab           " Change TABS to SPACES
set exrc                            " Local .vimrc
set foldlevel=1
set foldmethod=indent
set foldnestmax=10
set formatoptions=q     " Allow gq on a long line
set guifont=PragmataPro:h13
set linespace=1
set guioptions-=L
set guioptions-=r
set hidden                          " Allow buffer switching without saving
set history=1000
set history=1000                    " Store a ton of history (default is 20)
set hlsearch
set ignorecase          " ignore case when searching
set incsearch
set iskeyword+=#                    " '#' is an end of word designator
set iskeyword+=-                    " '-' is an end of word designator
set iskeyword+=.                    " '.' is an end of word designator
set laststatus=2
set lazyredraw
set linebreak
set list
set listchars=tab:›\ ,trail:⋅,nbsp:~,extends:❯,precedes:❮
set matchtime=1         " Blink them quickly
set mouse=a             " Use mouse
set nobackup
set noerrorbells
set nofoldenable
set nojoinspaces                    " No double space after dot when J
set noshowcmd             " Show (partial) command in the status line
set noshowmode
set nospell                           " Spell checking off
set nostartofline
set noswapfile
set notimeout
set novisualbell
set nowb
set nowrap              " Disable Wrap
set number
set regexpengine=1
set relativenumber
set shiftround          " Round to the nearest tabstop
set shiftwidth=2        "
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set showfulltag
set showmatch           " See matching brackets
set smartcase           " ignore case if search pattern is all lowercase,
set smartindent
set softtabstop=2       " when hitting <BS>, pretend like a tab is removed, even if spaces
set splitbelow
set splitright
set t_Co=256
set t_vb=
set tabstop=2           " 2 Spaces
set ttymouse=xterm2
set undodir=~/.vim/undo         " where to save undo histories
set undofile                    " Save undo's after file closes
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo
" set virtualedit=onemore             " Allow for cursor beyond last character
set wildignore+=*.gif,*.jpg,*.png,*.log
set wildignore+=*.o,*.out,*.obj,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.swp,*~,._*
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/resources/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=.DS_Store
set wildignore+=.DS_Store,vim/undo/**,/var/folders/**,vendor/gems/*,*.png,*.PNG,*.JPG,*.jpg,*.GIF,*.gif,vendor/**,coverage/**,tmp/**,rdoc/**"
set wildignore+=node_modules/*
set wildignorecase
set wildmenu
set wildmode=longest:full,full " best way
set winminheight=0
set winminwidth=0

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
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
  autocmd FileType vim setlocal fdm=indent

  au BufNewFile,BufRead *.json setf javascript
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
augroup END

" Strip trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :silent! g/^\_$\n\_^$/d
autocmd BufReadPost fugitive://* set bufhidden=delete

" SYNTAX HIGHLIGHTING
syntax on
set background=dark
colorscheme Tomorrow-Night
let g:gitgutter_override_sign_column_highlight = 0
highlight GitGutterAdd ctermfg=green
highlight GitGutterDelete ctermfg=red
highlight GitGutterChange ctermfg=yellow
highlight GitGutterChangeDelete ctermfg=yellow
highlight DiffAdd     term=bold ctermbg=4 guibg=DarkBlue
highlight DiffChange  term=bold ctermbg=5 guibg=DarkMagenta
highlight DiffDelete  term=bold ctermfg=12 ctermbg=6 gui=bold guifg=Blue guibg=DarkCyan
highlight DiffText    term=reverse cterm=bold ctermbg=9 gui=bold guibg=Red
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
nnoremap 0 ^
nnoremap ^ 0

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>

nnoremap - :Switch<cr>

" Ctrl-J - insert line under cursor
inoremap <c-j> <esc>o
" Better splits
" nnoremap <C-W>s Hmx`` \|:split<CR>`xzt``

fun! Increment(dir, count)
  " No number on the current line
  if !search('\d', 'c', getline('.'))
    return
  endif

  " Store cursor position
  let l:save_pos = getpos('.')

  " Add spaces around the number
  s/\%#\d/ \0 /
  call setpos('.', l:save_pos)
  normal! l

  " Increment or decrement the number
  if a:dir == 'prev'
    execute "normal! " . repeat("\<C-x>"), a:count
  else
    execute "normal! " . repeat("\<C-a>", a:count)
  endif

  " Remove the spaces
  s/\v (\d{-})%#(\d) /\1\2/

  " Restore cursor position
  call setpos('.', l:save_pos)
endfun

nnoremap <silent> g<C-a> :<C-u>call Increment('next', v:count1)<CR>
nnoremap <silent> g<C-x> :<C-u>call Increment('prev', v:count1)<CR>

" Quick write
nmap <leader>w :w!<cr>
" Quick quit
nmap <leader>q :q<cr>
" Quick reindent
nmap === mrgg=Gg`rzz

" screen line scroll
map <silent> j gj
map <silent> k gk

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
" let g:rspec_command = "Dispatch rspec {spec}"
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

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
" inoremap <C-h> <esc><C-w>h
" inoremap <C-j> <esc><C-w>j
" inoremap <C-k> <esc><C-w>k
" inoremap <C-l> <esc><C-w>l

" Useful mappings for managing tabs
" map <leader>tn :tabnew<cr>
" map <leader>to :tabonly<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove

" window killer
nmap Q :qa!<CR>        " force quit

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

function! GoBackToRecentBuffer()
  let startName = bufname('%')
  while 1
    exe "normal! \<c-o>"
    let nowName = bufname('%')
    if nowName != startName
      break
    endif
  endwhile
endfunction

nnoremap <silent> <C-U> :call GoBackToRecentBuffer()<Enter>

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
" Escape/unescape & < > HTML entities in range (default current line).
function! HtmlEntities(line1, line2, action)
  let search = @/
  let range = 'silent ' . a:line1 . ',' . a:line2
  if a:action == 0  " must convert &amp; last
    execute range . 'sno/&lt;/</eg'
    execute range . 'sno/&gt;/>/eg'
    execute range . 'sno/&amp;/&/eg'
  else              " must convert & first
    execute range . 'sno/&/&amp;/eg'
    execute range . 'sno/</&lt;/eg'
    execute range . 'sno/>/&gt;/eg'
  endif
  nohl
  let @/ = search
endfunction
command! -range -nargs=1 Entities call HtmlEntities(<line1>, <line2>, <args>)
noremap <silent> \h :Entities 0<CR>
noremap <silent> \H :Entities 1<CR>
