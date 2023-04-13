set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'

call plug#end()

syntax off
set visualbell t_vb=

"" let g:lsp_log_verbose = 1
"" let g:lsp_log_file = expand('~/vim-lsp.log')
let g:lsp_document_code_action_signs_enabled = 0

if system('uname -a | grep microsoft') != ''
  autocmd TextYankPost * call system('win32yank.exe -i --crlf', @")

  function! Paste(mode)
	let @" = system('win32yank.exe -o --lf')
	return a:mode
  endfunction

  map <expr> p Paste('p')
  map <expr> P Paste('P')
endif

autocmd BufWritePre * :FixWhitespace

"" set vim variables """"""""""""""""""""""""""""""""""""""""""""""""""""""

set viminfo+=n~/.vim/viminfo.txt
set directory=~/.vim/directory
set backupdir=~/.vim/backupdir
set undodir=~/.vim/undodir
set undofile
set backup

set hidden
set incsearch
set hlsearch
set ignorecase
set smartcase

set laststatus=2
set clipboard=unnamed
set omnifunc=lsp#complete

set statusline=%F%m\ %=%l:%v\ %{&ff}

"" key maps """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\,"
nnoremap <silent> <Leader>v :edit $HOME/.vimrc<CR>
nnoremap <Leader>re :source $HOME/.vimrc<CR>
nnoremap <Leader>gh :!git brws %<CR><CR>
nnoremap <Leader>tt :!tig<CR><CR>
nnoremap <Leader>tb :!tig blame %<CR>

nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <c-h> :History<CR>
nnoremap <silent> <c-k> :Buffers<CR>

nnoremap <silent> <C-]> :LspDefinition<CR>
nnoremap <silent> <C-\> :LspTypeDefinition<CR>
nnoremap <silent> <Leader>a :LspCodeAction<CR>
nnoremap <silent> <Leader>e :LspRename<CR>
nnoremap <silent> <Leader>r :LspReferences<CR>
nnoremap <silent> <Leader>i :LspImplementation<CR>
nnoremap <silent> <Leader>f :LspDocumentFormat<CR>
nnoremap <silent> <Leader>l :LspDocumentDiagnostics<CR>
nnoremap <silent> <Leader>n :LspNextError<CR>
nnoremap <silent> <Leader>p :LspPreviousError<CR>
