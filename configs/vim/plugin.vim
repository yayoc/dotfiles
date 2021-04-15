call plug#begin()

" Color scheme
Plug 'joshdick/onedark.vim'
Plug 'jdsimcoe/abstract.vim'
Plug 'w0ng/vim-hybrid'
Plug 'sts10/vim-pink-moon'
Plug 'tlhr/anderson.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'ayu-theme/ayu-vim'
Plug 'chriskempson/base16-vim'

" Nerdtree
Plug 'scrooloose/nerdtree'

map <leader>r :NERDTreeFind<cr>
let NERDTreeShowHidden=1

" Check
" Check if NERDTree is open or active
function! s:isNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! s:syncTree()
  if &modifiable && s:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call s:syncTree()

autocmd vimenter * NERDTree
autocmd InsertLeave * set nopaste
autocmd FileType * set formatoptions-=ro

Plug 'sheerun/vim-polyglot'
let g:rustfmt_autosave = 1
Plug 'airblade/vim-gitgutter'
Plug 'neomake/neomake'
let g:neomake_python_python_exe = 'python3'

Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<Cr>
nnoremap <C-r> :Rg<Cr>

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'sbdchd/neoformat'
" https://github.com/sbdchd/neoformat/issues/143
if isdirectory($PWD .'/node_modules')
    let $PATH .= ':' . $PWD . '/node_modules/.bin'
endif
" autocmd BufWritePre * Neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

let g:lsp_diagnostics_enabled = 0 " disable diagnostics support
" for debug lsp
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
endif

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescriptreact'],
        \ })
endif

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <f2> <plug>(lsp-rename)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the
    " server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

call plug#end()

call neomake#configure#automake('w')

