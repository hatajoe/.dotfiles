call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'w0rp/ale'
Plug 'thoughtbot/vim-rspec'

call plug#end()

syntax on
set t_Co=0

"" fzf
set rtp+=/usr/local/opt/fzf
command! -nargs=? Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -nargs=? Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

"" vim-lsp
let g:lsp_diagnostics_enabled = 0
"" let g:lsp_log_verbose = 1
"" let g:lsp_log_file = expand('~/vim-lsp.log')

au User lsp_setup call lsp#register_server({
\	'name': 'solargraph',
\	'cmd': {server_info->[&shell, &shellcmdflag, 'bundle exec solargraph stdio']},
\	'initialization_options': {"diagnostics": "true"},
\	'whitelist': ['ruby'],
\ })

au User lsp_setup call lsp#register_server({
\	'name': 'typescript-language-server',
\	'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
\	'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
\	'whitelist': ['typescript', 'typescriptreact'],
\ })

"" vim-go
let g:go_info_mode = 'gopls'
let g:go_def_mode = 'gopls'
let g:go_fmt_command = "goimports"

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

au FileType ruby nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
au FileType ruby,javascript,javascriptreact,typescript,typescriptreact nnoremap <buffer> <C-]> :LspDefinition<CR>
