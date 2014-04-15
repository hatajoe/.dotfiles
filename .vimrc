"" Vundle """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
" Keep Plugin commands between here and filetype plugin indent on.
Plugin 'editorconfig/editorconfig-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'

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

"" 相対行番号表示
:set relativenumber

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

"" 自動でコメントアウトされちゃうのやめる 
autocmd FileType * setlocal formatoptions-=ro

"" Custom Key Map """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

"" Esc連打でワードハイライトをオフにする
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"" 新規タブウィンドウ
nnoremap <silent> ,t :tabe<CR> 

"" ツリー表示切り替え
nnoremap <silent> ,o :NERDTreeCWD<CR> 
nnoremap <silent> ,oo :NERDTreeToggle<CR> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" Open junk file."{{{
command! -nargs=0 JK call s:open_junk_file()
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

"" eclim
"" let g:EclimCompletionMethod = 'omnifunc'
"" nnoremap <silent> <buffer> <cr> :PhpSearchContext<cr>
"" 
"" command! -nargs=0 XPhpSearchClass call s:php_search_pattern('class')
"" command! -nargs=0 XPhpSearchFunction call s:php_search_pattern('function')
"" command! -nargs=0 XPhpSearchField call s:php_search_pattern('field')
"" function! s:php_search_pattern(type) abort
""     let l:pattern = input('pattern: ')
""     if l:pattern != ''
""         execute 'PhpSearch -p' l:pattern '-t' a:type '-s project'
""     endif
"" endfunction"}}}
"" 
"" nnoremap <silent> <buffer> ,sc :XPhpSearchClass<cr>
"" nnoremap <silent> <buffer> ,sf :XPhpSearchFunction<cr>
"" nnoremap <silent> <buffer> ,sm :XPhpSearchField<cr>

"" for php
autocmd FileType php set makeprg=php\ -l\ %
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endi

"" for golang
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview

"" solaraized設定
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

"" python
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

