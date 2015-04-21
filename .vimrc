"
" Vundle
" https://github.com/gmarik/vundle
" ----------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

" Open in ~/sites by default
cd ~/sites
" disable auto backups and swap files
set nobackup
set noswapfile


" Plugin Settings
" ----------------------
" ctrlp - fuzzy search
set wildignore+=*/node_modules/**
set wildignore+=*/.git/**
let g:ctrlp_by_filename = 1


" Colors
" ----------------------
syntax enable           " enable syntax processing
if has('gui_running')
  set guifont=Menlo\ Regular:h14
  let g:solarized_termcolors=256
  set background=dark
  colorscheme solarized 
endif


" Spaces & Tabs
" ----------------------
set tabstop=2           " number of visual spaces per TAB
set softtabstop=2       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set shiftwidth=2        " indentation with << and >>
set shiftround          " use multiple of shitwidth when indenting with < and >
set autoindent          " autoindent lines
set copyindent          " copy the indentation on autoindenting


" UI Config
" ----------------------
set number              " show line numbers
set cursorline          " highlight current line
filetype indent plugin on " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set ruler               " line/character numbers bottom right


" Searching 
" ----------------------
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,
                        "   case-sensitive otherwise


" Folding
" ----------------------
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level


" Movement
" ----------------------
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]


" File Management
" ----------------------
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" Leader Shortcuts
" ----------------------
let mapleader=","      " leader is comma

" NERDTree to Ctrl + n
map <C-n> :NERDTreeToggle<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" jk is escape
:imap jk <Esc>

" turn off search highlight
nnoremap <leader><space> :set hlsearch!<CR>
