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
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

NeoBundle 'Shougo/vimfiler'

NeoBundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1

NeoBundle 'kana/vim-fakeclip.git'

NeoBundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

NeoBundle 'tpope/vim-surround'

NeoBundle 'kana/vim-operator-user.git'
NeoBundle 'tyru/operator-camelize.vim'
nmap ,C <Plug>(operator-camelize-toggle)
vmap ,C <Plug>(operator-camelize-toggle)

NeoBundle 'moll/vim-node.git'
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
au FileType javascript call JavaScriptFold()

NeoBundle 'editorconfig/editorconfig-vim'

filetype plugin indent on     " Required!

"" tab
nnoremap <silent> ,t :tabe<CR> 

" disable auto comment out 
autocmd FileType * setlocal formatoptions-=ro

"" turn off word highlight
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"" php syntax check
autocmd FileType php set makeprg=php\ -l\ %
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endi

"" for golang
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview

" Open junk file."{{{
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
  let l:junk_dir = $HOME . '/.vim_junk'. strftime('/%Y/%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.'))
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction"}}}

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" Installation check.
NeoBundleCheck
