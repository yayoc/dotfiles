call plug#begin()

Plug 'scrooloose/nerdtree'

" Nerdtree
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

Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
set updatetime=300

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

call plug#end()
