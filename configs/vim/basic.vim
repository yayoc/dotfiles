" Colors

syntax on " enable syntax processing

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

set ignorecase " ignore case when searching
set incsearch " search as characters are entered
set hlsearch " highlight all matches

" Folding

set foldenable " enable folding
set foldlevelstart=10 " open most folds by default

" Sound
set belloff=all

" Swap
set noswapfile
