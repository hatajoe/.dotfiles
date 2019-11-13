"" Vundle """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'junegunn/fzf.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'fatih/vim-go'
Plugin 'thoughtbot/vim-rspec'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"" fzf
set rtp+=/usr/local/opt/fzf
let g:fzf_tags_command = 'git ctags'
command! -nargs=? Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -nargs=? Ag
\ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

"" solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_hitrail=1
let g:solarized_visibility=1
set background=dark
colorscheme solarized

"" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'

"" vim-javascript
let g:javascript_enable_domhtmlcss = 1

"" ale
let g:ale_linters = {
\   'go': ['gobuild', 'govet'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'ruby': ['rubocop'],
\}
let g:ale_fixers = {
\   'go': [],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'ruby': ['rubocop'],
\}
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_text_changed = 'never'
let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_executable = 'bin/rubocop'

"" jq
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq 95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;" . l:arg . "95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;"
endfunction

"" vim-rspec
let g:rspec_command = '!bin/rspec {spec}'

"" netrw
let g:netrw_liststyle=1
let g:netrw_banner=0
let g:netrw_sizestyle="H"
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"

"" Ordinary """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" シンタックスハイライトをon
syntax enable

"" 各種ファイルの保存先指定
set viminfo+=n~/.vim/viminfo.txt
set directory=~/.vim/directory
set backupdir=~/.vim/backupdir
set undodir=~/.vim/undodir
set undofile
set tags+=.git/tags

"" 文字コード、ファルフォーマット
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2,cp932,sjis
set fileformats=unix,dos,mac

"" 全角文字を全角表示で
set ambiwidth=double

"" クリップボード使用
set clipboard=unnamed

"" ステータスライン設定
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%04l,%04v][%p%%]
set laststatus=2

"" 挿入モードに入る時に表示
set showmode

"" 対応する括弧をハイライト
set showmatch

"" 自動インデント
set smartindent

"" インデント
au BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4 softtabstop=0
au BufNewFile,BufRead *.rb set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.js set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.ts set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.jsx set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.tsx set expandtab tabstop=2 shiftwidth=2

"" インクリメンタルサーチon
set incsearch
"" 検索時に大文字小文字を区別しない
set ignorecase
"" 検索語に大文字を含む場合は大文字小文字を区別する
set smartcase
"" 検索結果をハイライト
set hlsearch
"" 補完表示タイプ
set completeopt=menu

set autowrite

"" Custom Key Map """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\,"

" Edit vimrc
nmap <Leader>v :edit $HOME/.vimrc<CR>
nmap <Leader>re :source $HOME/.vimrc<CR>

"" 新規タブウィンドウ
nnoremap <silent> <Leader>w :tabe<CR>

nnoremap <c-p> :Files<CR>
nnoremap <c-g> :Ag<SPACE>

au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <leader>r <Plug>(go-referrers)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType ruby nmap <Leader>t :call RunCurrentSpecFile()<CR>
au FileType ruby nmap <Leader>l :call RunLastSpec()<CR>
