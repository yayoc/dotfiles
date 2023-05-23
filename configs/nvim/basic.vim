" Colors

syntax enable " enable syntax processing

" Spaces & Tabs

set tabstop=4 " 4 space tab
set expandtab " use spaces for tabs
set softtabstop=4 " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent

" UI Layout

set number " show line numbers
set showcmd " show command in bottom bar
set nocursorline " highlight current line
set wildmenu
set lazyredraw
set showmatch " higlight matching parenthesis
set fillchars+=vert:┃
set clipboard=unnamed " copy to the system clipboard
set guifont=Monaco:h14

" Searching

set incsearch " search as characters are entered
set hlsearch " highlight all matches

" Sound
set belloff=all

" Swap
set noswapfile

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

