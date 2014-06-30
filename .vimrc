" Vundle """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle'
" Keep Plugin commands between here and filetype plugin indent on.
Plugin 'tpope/vim-pathogen'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite.vim'
Plugin 'rizzatti/dash.vim'

Plugin 'kchmck/vim-coffee-script'

filetype plugin indent on     " required
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
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

"" シンタックスハイライトをon
syntax enable

"" 各種ファイルの保存先指定
:set viminfo+=n~/.vim/
:set directory=~/.vim/tmp/swp
:set backupdir=~/.vim/tmp/back
:set tags+=.git/tags

"" 文字コード、ファルフォーマット
:set encoding=utf-8
:set fileencoding=utf-8
:set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2,cp932,sjis
:set fileformats=unix,dos,mac

"" 全角文字を全角表示で
:set ambiwidth=double

"" クリップボード使用
:set clipboard=unnamed

"" ステータスライン設定
:set statusline=%F%m%r%h%w\ [%{&ff}]\ [%04l,%04v][%p%%]
:set laststatus=2 

"" 自動再読み込み
:set autoread

"" 挿入モードに入る時に表示
:set showmode

"" 対応する括弧をハイライト
:set showmatch

"" 自動インデント
" :set autoindent
:set smartindent
"" タブで空白入力
:set expandtab
"" インデント文字数
:set tabstop=4
:set shiftwidth=4
:set softtabstop=0

"" インクリメンタルサーチon
:set incsearch
"" 検索時に大文字小文字を区別しない
:set ignorecase
"" 検索語に大文字を含む場合は大文字小文字を区別する
:set smartcase
"" 検索結果をハイライト
:set hlsearch

"" 自動でコメントアウトされちゃうのやめる 
autocmd FileType * setlocal formatoptions-=ro

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

"" Unite
nnoremap <silent> ,up :Unite -start-insert file_rec/async:!<cr>
nnoremap <silent> ,ur :Unite buffer file_mru<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

"" for golang
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview

"" for coffee
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd BufWritePost *.coffee silent make!

"" solarized設定
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_hitrail=1
let g:solarized_visibility=1
set background=dark
colorscheme solarized

"" YouCompleteMe
let g:ycm_path_to_python_interpreter='/usr/bin/python'
let g:ycm_collect_identifiers_from_tags_files=0
let g:ycm_auto_trigger=0

"" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

"" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"" Unite
call unite#custom#source('file_rec/async', 'ignore_pattern', '\(png\|gif\|jpeg\|jpg\)$')
let g:unite_source_rec_max_cache_files = 5000

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
