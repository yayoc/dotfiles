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

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'

call plug#end()

lua << EOF
require('mason').setup()

local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end  -- Mappings.
  local opts = { noremap=true, silent=true }  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
end

nvim_lsp.tsserver.setup{
  on_attach = on_attach
}

EOF
