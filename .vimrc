call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

syntax off

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
set completeopt=menu

set laststatus=2
set clipboard=unnamed

"" key maps """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\,"
nnoremap <silent> <Leader>v :edit $HOME/.vimrc<CR>
nnoremap <Leader>re :source $HOME/.vimrc<CR>

nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <c-h> :History<CR>
nnoremap <silent> <c-k> :Buffers<CR>

nnoremap <silent> <C-]> :LspDefinition<CR>
nnoremap <silent> <C-\> :LspTypeDefinition<CR>
nnoremap <silent> <Leader>e :LspRename<CR>
nnoremap <silent> <Leader>r :LspReferences<CR>
nnoremap <silent> <Leader>i :LspImplementation<CR>
nnoremap <silent> <Leader>f :LspDocumentFormat<CR>
nnoremap <silent> <Leader>l :LspDocumentDiagnostics<CR>
