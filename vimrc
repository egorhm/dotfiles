"set guifont=DejaVu\ Sans\ Mono\ 9
"set guifont=Source\ Code\ Pro\ 10
set guifont=Ubuntu\ Mono\ 11
set nocompatible              " be iMproved, required"
filetype off                  " required
filetype plugin indent on     " required

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-surround'
Plug 'egorhm/vim-hybrid'
Plug 'moll/vim-bbye'
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
" Initialize plugin system
call plug#end()

source $VIMRUNTIME/mswin.vim
behave mswin

set runtimepath^=~/.vim/bundle
"----------------------------------------------------
"Settings
"----------------------------------------------------
set noerrorbells                "No beep
syntax on
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set hidden

set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase
set ttyfast
set lazyredraw                  " Wait to redraw "

set textwidth=80                " set maximum line width to 80 characters

set nocursorcolumn
set cursorline
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set linespace=2

" dont save .netrwhist history
let g:netrw_dirhistmax=0

set ruler                       " Show the cursor position all the time
au FocusLost * :wa              " Set vim to save the file on focus out.

" Just go out in insert mode
imap jk <ESC>l

let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
set background=dark
if has("gui_running")
   colorscheme hybrid
   set guioptions-=m
   set guioptions-=r
   set guioptions-=L
   set guioptions-=T
else
   if $COLORTERM == 'gnome-terminal'
     set t_Co=256
     colorscheme hybrid
   endif
endif

" Buffer prev/next
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

let mapleader = ","
let g:mapleader = ","

" Close quickfix easily
nnoremap <leader>a :cclose<CR>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Map save current buffer
nmap <leader>w :w!<cr>

set autoindent
set complete-=i
set showmatch
set smarttab
set completeopt-=preview

au FileType python map <silent> <leader>b oimport pdb; pdb.set_trace() #XXX:Breakpoint<esc>
au FileType python map <silent> <leader>B Oimport pdb; pdb.set_trace() #XXX:Breakpoint<esc>

"------------------------------------------------------------
"NerdTree
"------------------------------------------------------------
nmap <F2> :NERDTreeToggle<CR>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let NERDTreeWinSize = 30

let NERDTreeIgnore=['\~$', '\.AppleDouble$', '\.beam$', 'build$',
\'dist$', '\.DS_Store$', '\.egg$', '\.egg-info$', '\.la$',
\'\.lo$', '\.\~lock.*#$', '\.mo$', '\.o$', '\.pt.cache$',
\'\.pyc$', '\.pyo$', '__pycache__$', '\.Python$', '\..*.rej$',
\'\.rej$', '\.ropeproject$', '\.svn$', '\.tags$' ]

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"------------------------------------------------------------
"EasyMotion
"-----------------------------------------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10             " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'        " jump to a file if it's open already
let g:ctrlp_mruf_max=450                " number of recently opened files
let g:ctrlp_max_files=0                 " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

"Tagbar settings
"------------------------------------------------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
nmap <F3> :TagbarToggle<CR>

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

if executable('ag')
 "let g:ackprg = 'ag'
endif

"--------------------------------------------------------------
"vim-airline settings
"--------------------------------------------------------------
let g:airline_detect_iminsert = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'sol'
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_exclude_preview = 0

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"----------------------------------------------------------------
"CtrlP settings
"----------------------------------------------------------------
let g:ctrlp_by_filename = 1
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10              " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'         " jump to a file if it's open already
let g:ctrlp_mruf_max=450                 " number of recently opened files
let g:ctrlp_max_files=0                  " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

"let g:pymode_options = 0
"let g:pymode_lint_write = 0
"let g:pymode_folding = 0
"let g:pymode_rope = 1
"let g:pymode_virtualenv = 1
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>b'

let g:jedi#show_call_signatures = "1"
set updatetime=500

"---------------------------------------------------------------
"Fugitive
"---------------------------------------------------------------
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gl :Glog -4<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gs :Git status -sb<cr>

"---------------------------------------------------------------
"GitGutter settings
"---------------------------------------------------------------
set signcolumn=yes


let g:python_highlight_all = 1

"---------------------------------------------------------------
"Bbye settings
"---------------------------------------------------------------
:nnoremap <Leader>q :Bdelete<CR>

