if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
" Plug 'skammer/vim-ruby-complexity'
Plug 'vrybas/vim-flog'
let g:flog_enable = 1          " Выключен и запускается только по хоткею,
                               " т.к. он довольно медленный на больших файлах.
let g:flog_medium_limit = 15   " Предел сложности 'средняя'.
let g:flog_high_limit   = 25   " Предел сложности 'высокая'.
let g:flog_hide_low     = 1    " Не показывать score методов с низкой
                               " сложностью ( < 15).
let g:flog_hide_medium  = 0    " Показывать score методов со средней сложностью.
nmap <silent><leader><leader>c :call ShowComplexity()<CR> " Маппинг

Plug 'vim-scripts/SyntaxComplete'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plug 'othree/yajs.vim'
" Plug 'szw/vim-tags'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'
" " disables all automatic tags highlighting
" let g:easytags_auto_highlight = 0
" let g:easytags_async = 1
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sjl/tslime.vim'
Plug 'ironcamel/vim-script-runner'
Plug 'edkolev/tmuxline.vim'
let g:tmuxline_powerline_separators = 0
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" Plug 'vim-scripts/camelcasemotion'
" " Plug 'vim-scripts/camelcasemotion'
" map w <Plug>CamelCaseMotion_w
" map b <Plug>CamelCaseMotion_b
" map e <Plug>CamelCaseMotion_e
" sunmap w
" sunmap b
" sunmap e
" nmap cw ce
" omap iw ie
" xmap iw ie
" omap iw <Plug>CamelCaseMotion_iw
" xmap iw <Plug>CamelCaseMotion_iw
" omap ib <Plug>CamelCaseMotion_ib
" xmap ib <Plug>CamelCaseMotion_ib
" omap ie <Plug>CamelCaseMotion_ie
" xmap ie <Plug>CamelCaseMotion_ie

Plug 'scrooloose/syntastic'
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_checkers = ['jslint', 'jshint', 'eslint']
let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "≈"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 3
Plug 'habamax/vim-skipit'
imap <C-F> <Plug>SkipIt
Plug 'majutsushi/tagbar'
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'vim-ruby/vim-ruby'
Plug 't9md/vim-ruby-xmpfilter'
autocmd FileType ruby nmap <buffer> <D-m> <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <D-m> <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <D-m> <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <D-r> <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <D-r> <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <D-r> <Plug>(xmpfilter-run)
" Plug 'henrik/vim-yaml-flattener'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'jszakmeister/vim-togglecursor'
" Editing
Plug 'terryma/vim-multiple-cursors'
" Plug 'ervandew/supertab' ",  { 'on': '<Plug>SuperTab' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMPLETION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'

let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/splitjoin.vim'
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mattn/emmet-vim'
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_confirm_save = 0
" nmap     <C-F>f <Plug>CtrlSFPrompt
" vmap     <C-F>f <Plug>CtrlSFVwordPath
" vmap     <C-F>F <Plug>CtrlSFVwordExec
" nmap     <C-F>n <Plug>CtrlSFCwordPath
" nmap     <C-F>p <Plug>CtrlSFPwordPath
" nnoremap <C-F>o :CtrlSFOpen<CR>
" nnoremap <C-F>t :CtrlSFToggle<CR>
" inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
Plug 'sjl/vitality.vim'
Plug 'christoomey/vim-tmux-navigator'

" ----------------------------------------------------------------------------
" NERDTREE
" ----------------------------------------------------------------------------
Plug 'scrooloose/nerdtree'
Plug 'low-ghost/nerdtree-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeHijackNetrw=0
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nc :NERDTreeCWD<cr>

" ----------------------------------------------------------------------------
" fzf
" ----------------------------------------------------------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
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

Plug 'rking/ag.vim'
Plug 'maksimr/vim-jsbeautify'
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
Plug 'tpope/vim-rbenv'
nmap <C-e> <Plug>VinegarVerticalSplitUp
" let g:netrw_liststyle=3

" Plug 'thoughtbot/vim-rspec'
" let g:rspec_command = "Dispatch rspec {spec}"
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>
Plug 'janko-m/vim-test'
let test#strategy = 'dispatch'
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>a :Dispatch rspec<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

"###############################################################################

" ----------------------------------------------------------------------------
" JSX
" ----------------------------------------------------------------------------
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

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

" vim-jsbeautify
" map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

call plug#end()
