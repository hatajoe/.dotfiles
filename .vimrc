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
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'nixprime/cpsm'
Plugin 'chase/vim-ansible-yaml'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'fatih/vim-go'
Plugin 'garyburd/go-explorer'
Plugin 'majutsushi/tagbar'
Plugin 'glidenote/memolist.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'thinca/vim-quickrun'
Plugin 'Shougo/vimproc'

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

"" solarized設定
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
let g:go_def_mode = 'godef'

"" vim-javascript
let g:javascript_enable_domhtmlcss = 1

"" quickrun
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
\   'runner'    : 'vimproc',
\   'runner/vimproc/updatetime' : 60,
\   'outputter' : 'error',
\   'outputter/error/success' : 'quickfix',
\   'outputter/error/error'   : 'quickfix',
\   'outputter/buffer/split'  : ':rightbelow 8sp',
\   'outputter/buffer/close_on_empty' : 1,
\}
let g:quickrun_config["gobuild"] = {
\   'command': 'go',
\   'cmdopt' : './...',
\   'exec': '%c build %o',
\   "errorformat": '%f:%l: %m,%-G%.%#',
\}
let g:quickrun_config["gitctags"] = {
\   'command': 'git',
\   'exec': '%c ctags',
\}
autocmd BufWritePost *.go :QuickRun gobuild

"" memolist
let g:memolist_path = "~/.vim/memo"
nmap ,mf :exe "CtrlP" g:memolist_path<cr><f5>
nmap ,m :MemoNew<cr>

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

"" 自動再読み込み
set autoread

"" 挿入モードに入る時に表示
set showmode

"" 対応する括弧をハイライト
set showmatch

"" 自動インデント
" :set autoindent
set smartindent
"" タブで空白入力
set expandtab
"" インデント文字数
set tabstop=4
set shiftwidth=4
set softtabstop=0
au BufNewFile,BufRead *.rb set noexpandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.js set noexpandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.jsx set noexpandtab tabstop=2 shiftwidth=2

"" インクリメンタルサーチon
set incsearch
"" 検索時に大文字小文字を区別しない
set ignorecase
"" 検索語に大文字を含む場合は大文字小文字を区別する
set smartcase
"" 検索結果をハイライト
set hlsearch

"" 自動でコメントアウトされちゃうのやめる 
autocmd FileType * setlocal formatoptions-=ro

"" 補完表示タイプ
set completeopt=menu

"" Custom Key Map """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

let mapleader = "\,"

" Edit vimrc
nmap <Leader>v :edit $HOME/.vimrc<CR>

"" 新規タブウィンドウ
nnoremap <silent> <Leader>w :tabe<CR> 

"" tagbar
nmap <F8> :TagbarToggle<CR>

au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

