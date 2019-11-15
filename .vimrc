call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'fatih/vim-go'
Plug 'thoughtbot/vim-rspec'

call plug#end()

filetype on
syntax off

"" fzf
set rtp+=/usr/local/opt/fzf
command! -nargs=? Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -nargs=? Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

"" vim-go
let g:go_def_mode='gopls'

"" ale
let g:ale_linters = {
\	'go': ['gobuild', 'govet'],
\	'javascript': ['eslint'],
\	'typescript': ['eslint'],
\	'typescriptreact': ['eslint'],
\	'ruby': ['rubocop'],
\}
let g:ale_fixers = {
\	'go': [],
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\	'javascript': ['prettier'],
\	'typescript': ['prettier'],
\	'typescriptreact': ['prettier'],
\	'ruby': ['rubocop'],
\}
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_text_changed = 'never'
let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_executable = 'bin/rubocop'

"" vim-rspec
let g:rspec_command = '!bin/rspec {spec}'

"" set vim variables """"""""""""""""""""""""""""""""""""""""""""""""""""""

set viminfo+=n~/.vim/viminfo.txt
set directory=~/.vim/directory
set backupdir=~/.vim/backupdir
set undodir=~/.vim/undodir
set undofile

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2,cp932,sjis
set fileformats=unix,dos,mac

set hlsearch
set incsearch
set ignorecase
set smartcase
set completeopt=menu

set statusline=%F%m\ %=%l:%v\ %{&ff}
set laststatus=2
set clipboard=unnamed

"" key maps """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\,"

nnoremap <silent> <Leader>v :edit $HOME/.vimrc<CR>
nnoremap <silent> <Leader>re :source $HOME/.vimrc<CR>
nnoremap <silent> <Leader>w :tabe<CR>
au FileType ruby nnoremap <Leader>t :call RunCurrentSpecFile()<CR>

nnoremap <c-p> :Files<CR>
nnoremap <c-h> :History<CR>
nnoremap <c-g> :Ag<SPACE>
