:set viminfo+=n~/.vim/
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
:set fileencodings=iso-2022-jp,euc-jp,utf-8,ucs-2,cp932,sjis
:set clipboard=unnamed

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
let g:unite_enable_start_insert = 0
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'kana/vim-fakeclip.git'

syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

filetype plugin indent on     " Required!

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" Installation check.
NeoBundleCheck
