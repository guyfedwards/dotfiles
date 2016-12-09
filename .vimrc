call plug#begin('~/.vim/plugged')
" General Vim
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'tmhedberg/matchit'
Plug 'Raimondi/delimitMate'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree' , { 'on':  'NERDTreeToggle' }
Plug 'sirver/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession'
Plug 'valloric/youcompleteme', { 'do': './install.py --tern-completer' }
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-peekaboo'

" Filetype specific
Plug 'digitaltoad/vim-pug', { 'for': ['pug', 'jade'] }
Plug 'fatih/vim-go', { 'for': 'go' }
" Plug 'othree/yajs.vim', { 'for': ['javascript', 'jsx', 'javascript.jsx']}
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'jsx', 'javascript.jsx']}
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'eruby', 'mustache', 'handlebars', 'hbs'] }
Plug 'moll/vim-node', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
Plug 'mustache/vim-mustache-handlebars', { 'for': ['handlebars', 'mustache'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'jsx', 'javascript.jsx'], 'on': 'JsDoc' }
Plug 'tpope/vim-ragtag', { 'for': ['eruby', 'haml', 'php'] }

" Markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'junegunn/goyo.vim', { 'for': 'markdown', 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'for': 'markdown', 'on': 'Goyo' }
call plug#end()


" General
" ----------------------
" disable auto backups and swap files
set nobackup
set noswapfile
" markdown formatting for .md files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" source vimrc on save
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END
set laststatus=2
set backspace=2
" trim whitespace
autocmd BufWritePre * :%s/\s\+$//e
" tell it to use an undo file
set undofile
" " set a directory to store the undo history
set undodir=~/.vimundo/
" offset scroll few lines before bottom
set scrolloff=3
" mouse support
set mouse=a

" Plugin Settings
" ----------------------
" ctrlp - fuzzy search
set wildignore+=*/node_modules/**
set wildignore+=*/.git/**
let g:ctrlp_custom_ignore='dist'
let b:javascript_fold = 0
" NERDTree
let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=1
" airline
let g:airline#extensions#whitespace#enabled = 1
" let g:airline_theme='base16_eighties'
" let g:airline_theme='zenburn'
" let g:airline_powerline_fonts = 1
" let g:airline_section_z = '☲ %l/%L:%c'
" let g:airline_section_warning = ''
" lightline
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ }
" YouCompleteMe
let g:ycm_filetype_blacklist = {
  \ 'html' : 1
  \}
let g:ycm_filetype_specific_completion_to_disable = {
  \ 'html': 1
  \}
" Experimentally integrate YouCompleteMe with vim-multiple-cursors, otherwise
" the numerous Cursor events cause great slowness
" (https://github.com/kristijanhusak/vim-multiple-cursors/issues/4)
function Multiple_cursors_before()
  let s:old_ycm_whitelist = g:ycm_filetype_whitelist
  let g:ycm_filetype_whitelist = {}
endfunction

function Multiple_cursors_after()
  let g:ycm_filetype_whitelist = s:old_ycm_whitelist
endfunction

" using supertab to allow YCM and UltiSnips to play nice
" Set shortcuts for ycm
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
" if tab doesn't expand snippet, its passed to supertab which calls YCM
" shortcut from above
let g:SuperTabDefaultCompletionType = '<C-Tab>'
let g:delimitMate_expand_cr=1
let g:jsx_ext_required = 0

"neomake
autocmd! BufWritePost,BufReadPost * Neomake
let g:neomake_javascript_enabled_makers = ['jshint']
if filereadable(glob(".eslintrc.*"))
  let g:neomake_javascript_enabled_makers = ['eslint']
endif
let g:neomake_airline = 0

" use ag over grep
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore "node_modules" -g ""'
endif

let g:indentLine_char = '.'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '.'
let g:indentLine_bufNameExclude = ['*.jade']
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" JSDoc
let g:javascript_plugin_jsdoc = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_additional_descriptions = 1
let g:jsdoc_enable_es6 = 1
" Yajs
let g:used_javascript_libs = 'jquery,underscore,react,angularjs,jasmine,handlebars'
" fzf
nmap <C-p> :Files .<CR>

" Colors
" ----------------------
syntax enable           " enable syntax processing
let base16colorspace=256
set background=dark
"colorscheme Tomorrow-Night
" colorscheme base16-eighties
let g:seoul256_background = 237
colorscheme seoul256
set t_ut=


" Spaces & Tabs
" ----------------------
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4        " indentation with << and >>
set expandtab           " tabs are spaces
set shiftround          " use multiple of shitwidth when indenting with < and >
set autoindent          " autoindent lines
set copyindent          " copy the indentation on autoindenting

function! ToggleIndent()
  if &tabstop == 4
    set tabstop=2           " number of visual spaces per TAB
    set softtabstop=2       " number of spaces in tab when editing
    set shiftwidth=2        " indentation with << and >>
  else
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
  endif
endfunction


" UI Config
" ----------------------
set number              " show line numbers
set cursorline          " highlight current line
filetype indent plugin on " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set ruler               " line/character numbers bottom right
set colorcolumn=81      " show line at 81 chars, stop before the line
" change cursor in different modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif


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


" Commands
" ----------------------
nnoremap \ :Ag!<SPACE>
map Q <Nop>
" paste date for notes
map <F3> :r! date +"\%a \%b \%d \%T \%Z \%Y \|\| \%s"<CR>


" Leader Shortcuts
" ----------------------
let mapleader=","      " leader is comma

" Switch between last two files
map <leader><leader> <c-^>

" toggle indent
nmap <leader>tt :call ToggleIndent()<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" turn off search highlight
nnoremap <leader><space> :set hlsearch!<CR>

" toggle scrolloff between 999 and 0. 999 keeps line center screen
:nnoremap <leader>zz :let &scrolloff=999-&scrolloff<CR>

" toggle paste mode
set pastetoggle=<leader>p

" Nerdtree toggle
map <leader>nt :NERDTreeToggle<CR>

" select text that was jsut pasted
nnoremap <leader>v V`]
