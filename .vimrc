"
" Vundle
" https://github.com/gmarik/vundle
" ----------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-surround'
Plugin 'matchit.zip'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'ustache/vim-mustache-handlebars'



call vundle#end()
" General
" ----------------------
" disable auto backups and swap files
set nobackup
set noswapfile
" markdown formatting for .md files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
set laststatus=2
set encoding=utf-8
set backspace=2
" trim whitespace
autocmd BufWritePre * :%s/\s\+$//e


" Plugin Settings
" ----------------------
" ctrlp - fuzzy search
set wildignore+=*/node_modules/**
set wildignore+=*/.git/**
" Disable auto markdown preview. Use :InstantMarkdownPreview instead
let g:instant_markdown_autostart = 0
let b:javascript_fold = 0
let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=1
let g:airline#extensions#whitespace#enabled = 1


" Colors
" ----------------------
syntax enable           " enable syntax processing
let base16colorspace=256
set background=dark
"colorscheme solarized
colorscheme Tomorrow-Night
" airline theme
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
set t_ut=


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


" Window Management
" ----------------------
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Open new panes to right and bottom
set splitbelow
set splitright


" Syntax related
" ----------------------
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
" Liquid read as js/css/html
autocmd BufRead,BufNewFile *.html.liquid set filetype=html
autocmd BufRead,BufNewFile *.css/liquid set filetype=css
autocmd BufRead,BufNewFile *.js.liquid set filetype=javascript
autocmd BufRead,BufNewFile *.hbs set filetype=mustache

" Leader Shortcuts
" ----------------------
let mapleader=","      " leader is comma

" Switch between last two files
map <leader><leader> <c-^>

" Markdown preview
map <leader>md :InstantMarkdownPreview<CR>

" Emmet leader
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" jk is escape
:inoremap jk <Esc>

" turn off search highlight
nnoremap <leader><space> :set hlsearch!<CR>

" toggle scrolloff between 999 and 0. 999 keeps line center screen
:nnoremap <leader>zz :let &scrolloff=999-&scrolloff<CR>

" toggle paste mode
set pastetoggle=<leader>p

" Nerdtree toggle
map <leader>nt :NERDTreeToggle<CR>
