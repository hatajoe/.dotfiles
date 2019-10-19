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
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-bundler'
Plugin 'ngmy/vim-rubocop'
Plugin 'thoughtbot/vim-rspec'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'w0rp/ale'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'thinca/vim-quickrun'
Plugin 'Shougo/vimproc'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

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

"" ctrl-p
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_root_markers = ['.git']
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|vendor)$'

"" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_gocode_autobuild = 1

"" vim-javascript
let g:javascript_enable_domhtmlcss = 1
let g:ale_linters = {
\   'go': [],
\   'javascript': [],
\   'typescript': [],
\   'ruby': [],
\}
let g:ale_fixers = {
\   'go': [],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'ruby': ['rubocop'],
\}
let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_executable = 'bin/rubocop'

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
\}
let g:quickrun_config["gitctags"] = {
\   'command': 'git',
\   'exec': '%c ctags',
\}
autocmd BufWritePost *.go :QuickRun gobuild

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

" set filetypes as typescript.tsx
" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

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
au CursorHold * checktime

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

"" 自動でコメントアウトされちゃうのやめる
"" autocmd FileType * setlocal formatoptions-=ro

"" 補完表示タイプ
set completeopt=menu

"" Custom Key Map """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\,"

" Edit vimrc
nmap <Leader>v :edit $HOME/.vimrc<CR>
nmap <Leader>re :source $HOME/.vimrc<CR>

"" 新規タブウィンドウ
nnoremap <silent> <Leader>w :tabe<CR>

" jjで挿入モードから抜ける設定
inoremap <silent> jj <ESC>

" let g:go_bin_path = '${HOME}/go/bin'

au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <leader>r <Plug>(go-referrers)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType ruby nmap <Leader>t :call RunCurrentSpecFile()<CR>
au FileType ruby nmap <Leader>l :call RunLastSpec()<CR>
