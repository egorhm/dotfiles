color hybrid
set guifont=Monaco:h12

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'klen/python-mode'
Plugin 'tpope/vim-fugitive'

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

call vundle#end()            " required
filetype plugin indent on    " required

set modelines=0         " explicity turn off vim modelines (for security)
set encoding=utf-8      " use utf-8 character set by default
syntax on               " turn on syntax highlighting
set synmaxcol=800       " don't highlight lines longer than 800 characters
"
set ttyfast             " use a fast terminal connection
set visualbell          " use a visual bell instead of annoying beep
set title               " update the terminal title with file name
"
set number              " show absolute line number on current line
set cursorline          " highlight the line the cursor is on
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands at the bottom
set scrolloff=5         " keep 5 lines visible around cursor (if possible)
set matchtime=3         " highlight matching parens for 3 seconds
"
set textwidth=100       " set maximum line width to 80 characters
set colorcolumn=+1      " draw a right margin at the end of textwidth
set linebreak           " use soft-wrapping on long lines
"
set tabstop=4           " set hard tabstop size to 4
set softtabstop=4       " set soft tabstop size to 4
set shiftwidth=4        " set size of an 'indent' to 4
set shiftround          " when shifting, always use a multiple of shiftwidth
set autoindent          " automatically indent new lines
set expandtab           " use spaces instead of <tab>s
set smarttab            " make adding/removing tabs (spaces) smarter
"
set incsearch           " search incrementally as you type
set hlsearch            " highlight search matches
set ignorecase          " use case-insensitive search
set smartcase           " automatically decide to search with case or not
"
set autoread            " re-read an open file that has changed outside vim
"
set splitbelow          " always make new splits below, not above
set splitright          " always make new splits on the right, not on the
"
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2

let mapleader = ","

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.db