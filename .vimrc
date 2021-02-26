set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

call plug#end()

syntax off
"" set t_Co=0
set visualbell t_vb=

let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']

let g:cwd = getcwd()
if filereadable(expand(g:cwd.'/.golangci.yml'))
  let g:lsp_settings = {
  \  'golangci-lint-langserver': {'initialization_options': {'command': ['golangci-lint', 'run', '-c', g:cwd.'/.golangci.yml', '--out-format', 'json']}}
  \}
endif

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
set completeopt=menuone
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
nnoremap <c-t> :!tig
nnoremap <silent> <c-g> :!git brws -R upstream %<CR>

nnoremap <silent> <C-]> :LspDefinition<CR>
nnoremap <silent> <C-\> :LspTypeDefinition<CR>
nnoremap <silent> <Leader>a :LspCodeAction<CR>
nnoremap <silent> <Leader>e :LspRename<CR>
nnoremap <silent> <Leader>r :LspReferences<CR>
nnoremap <silent> <Leader>i :LspImplementation<CR>
nnoremap <silent> <Leader>f :LspDocumentFormat<CR>
nnoremap <silent> <Leader>l :LspDocumentDiagnostics<CR>
