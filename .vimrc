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
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'nixprime/cpsm'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elzr/vim-json'
Plugin 'vim-ruby/vim-ruby'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'

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

"" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_aggregate_errors=0
"" let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['go', 'php']}
let g:syntastic_go_checkers=['go', 'golint']
let g:syntastic_php_checkers=['php']

"" ctrlp
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

"" tagbar
nmap <F8> :TagbarToggle<CR>

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
auto BufWritePre *.go GoFmt

"" Custom Key Map """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" Edit vimrc
nmap ,v :edit $HOME/.vimrc<CR>

"" Esc連打でワードハイライトをオフにする
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"" 新規タブウィンドウ
nnoremap <silent> ,t :tabe<CR> 

"" buffer移動
nnoremap <silent> ,n :bnext<CR>
nnoremap <silent> ,p :bprev<CR>

