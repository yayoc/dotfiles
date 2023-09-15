call plug#begin()

" Color scheme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Nerdtree
Plug 'scrooloose/nerdtree'

map <leader>r :NERDTreeFind<cr>
let NERDTreeShowHidden=1

" Check if NERDTree is open or active
function! s:isNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window contains a modifiable
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
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

nnoremap <C-p> :GFiles<Cr>
nnoremap <C-g> :GFiles?<Cr>
nnoremap <C-r> :Rg<Cr>
nnoremap <C-b> :Buffers<Cr>
nnoremap <C-h> :History<Cr>

" autoformat c files
function! Formatonsave()
  let l:formatdiff = 1
  if has('unix')
    if filereadable('/usr/share/clang/clang-format-10/clang-format.py')
      py3f /usr/share/clang/clang-format-10/clang-format.py
    else
      echo "clang-format.py not found. Formatting might not work."
    endif
  endif
endfunction
autocmd BufWritePre *.h,*.cc,*.c,*.cpp call Formatonsave()

call plug#end()

