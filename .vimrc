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
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-dispatch'

Plugin 'nosami/Omnisharp'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'

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

"" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_aggregate_errors=1
let g:syntastic_go_checkers=['go', 'golint']
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']

"" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"" Ordinary """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" シンタックスハイライトをon
syntax enable

"" 各種ファイルの保存先指定
set viminfo+=n~/.vim/viminfo.txt
set directory=~/.vim/tmp/swp
set backupdir=~/.vim/tmp/back
set undodir=~/.vim/tmp/undo
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

"" for golang
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
exe "set rtp+=".globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
set completeopt=menu
auto BufWritePre *.go Fmt
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

"" for csharp
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
let g:syntastic_cs_checkers = ['syntax']
autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

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

"" NERDTree
nnoremap <silent> ,o :NERDTreeToggle<CR>

"" functions  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" Open junk file."{{{
command! -nargs=0 Junk call s:open_junk_file()
function! s:open_junk_file()
  let l:junk_dir = $HOME . '/.vim/tmp/junk/'. strftime('/%Y/%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif
  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d.'))
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction"}}}

