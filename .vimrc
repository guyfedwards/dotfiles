"
" Vundle
" https://github.com/gmarik/vundle
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'trusktr/seti.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'

call vundle#end()


" Colors
syntax enable           " enable syntax processing
colorscheme seti 

" Spaces & Tabs
set tabstop=2           " number of visual spaces per TAB
set softtabstop=2       " number of spaces in tab when editing
set expandtab           " tabs are spaces


" UI Config
set number              " show line numbers
set cursorline          " highlight current line
filetype indent plugin on " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]


" Searching 
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR> 


" Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level


" Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]


" Leader Shortcuts
let mapleader=","      " leader is comma

" NERDTree to Ctrl + n
map <C-n> :NERDTreeToggle<CR>
" jk is escape
:imap jk <Esc>

" Emmet use tab to expand
inoremap <buffer> <tab> <plug>(emmet-expand-abbr)
