:set viminfo+=n~/.vim/
:set rtp+=$GOROOT/misc/vim
:set noswapfile
:set nobackup
:set incsearch
:set ignorecase
:set showmatch
:set showmode
:set title
:set autoindent
:set encoding=utf-8
:set fileencoding=utf-8
:set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2,cp932,sjis
:set fileformats=unix,dos,mac
:set clipboard=unnamed
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set autoindent
:set smartindent

:set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
:set laststatus=2 

if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" Unite
NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,ug :<C-u>Unite grep<CR>

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'kana/vim-fakeclip.git'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-surround'

syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

let g:neocomplcache_enable_at_startup = 1

let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

filetype plugin indent on     " Required!

nnoremap <silent> ,t :tabe<CR> 

" disable auto comment out 
autocmd FileType * setlocal formatoptions-=ro

set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

autocmd FileType php set makeprg=php\ -l\ %
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endi

exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" Installation check.
NeoBundleCheck
