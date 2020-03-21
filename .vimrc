call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'w0rp/ale'

call plug#end()

syntax on
set t_Co=0

"" fzf
set rtp+=/usr/local/opt/fzf
command! -nargs=? Files call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': '--exact'}), <bang>0)
command! -nargs=? Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--exact'}), <bang>0)

"" vim-lsp
let g:lsp_diagnostics_echo_cursor = 1
"" let g:lsp_log_verbose = 1
"" let g:lsp_log_file = expand('~/vim-lsp.log')

"" ale
let g:ale_linters = {
\   'go': [],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\   'ruby': ['rubocop'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': [],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'ruby': ['rubocop'],
\}

let g:ale_ruby_rubocop_executable = 'bin/rubocop'

"" set vim variables """"""""""""""""""""""""""""""""""""""""""""""""""""""

set viminfo+=n~/.vim/viminfo.txt
set directory=~/.vim/directory
set backupdir=~/.vim/backupdir
set undodir=~/.vim/undodir
set undofile

set hidden
set incsearch
set hlsearch
set ignorecase
set smartcase
set completeopt=menu

set statusline=%F%m\ %=%l:%v\ %{&ff}
set laststatus=2
set clipboard=unnamed

"" key maps """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\,"
nnoremap <silent> <Leader>v :edit $HOME/.vimrc<CR>
nnoremap <Leader>re :source $HOME/.vimrc<CR>

nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <c-h> :History<CR>
nnoremap <silent> <c-k> :Buffers<CR>

au FileType go,ruby,javascript,javascriptreact,typescript,typescriptreact setlocal omnifunc=lsp#complete
nnoremap <silent> <C-]> :LspDefinition<CR>
nnoremap <silent> <C-\> :LspTypeDefinition<CR>
nnoremap <silent> <Leader>e :LspRename<CR>
nnoremap <silent> <Leader>r :LspReferences<CR>
nnoremap <silent> <Leader>i :LspImplementation<CR>
au FileType go nnoremap <Leader>f :LspDocumentFormat<CR>

au FileType ruby nnoremap <Leader>t :!bin/rspec %<CR>
au FileType ruby,javascript,javascriptreact,typescript,typescriptreact nnoremap <Leader>f :ALEFix<CR>
