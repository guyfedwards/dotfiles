if empty(glob('~/.vim/autoload/plug.vim'))
    if has('nvim')
        silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
endif

call plug#begin('~/.vim/plugged')
" General Vim
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'tmhedberg/matchit'
Plug 'Raimondi/delimitMate'
Plug 'rking/ag.vim'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'sirver/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install'}
Plug 'sheerun/vim-polyglot'

Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-peekaboo'

" Filetype specific
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'jsx', 'javascript.jsx']}
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'eruby', 'mustache', 'handlebars', 'hbs', 'javascript.jsx'] }
Plug 'moll/vim-node', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
Plug 'mustache/vim-mustache-handlebars', { 'for': ['handlebars', 'mustache'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'jsx', 'javascript.jsx'], 'on': 'JsDoc' }
Plug 'tpope/vim-ragtag', { 'for': ['eruby', 'haml', 'php'] }
Plug 'leshill/vim-json', { 'for': ['json', 'di'] }
Plug 'chrisbra/Colorizer', { 'for': ['scss', 'css', 'less', 'json']}

" Markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'junegunn/goyo.vim', { 'for': 'markdown', 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'for': 'markdown', 'on': 'Goyo' }
call plug#end()


" General
" ----------------------
" enable deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
" disable auto backups and swap files
set nobackup
set noswapfile
" markdown formatting for .md files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
set laststatus=2
set backspace=2
set encoding=utf8
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
au FileType scss :vert resize 60


" Plugin Settings
" ----------------------
"  NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


let b:javascript_fold = 0
" lightline
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'active': {
    \   'right': [[ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ], [ 'linter_warnings', 'linter_errors' ]]
    \ },
    \ 'component': {
    \     'lineinfo': '%3l/%L:%-2v'
    \ },
    \ 'component_expand': {
    \   'linter_warnings': 'LightlineLinterWarnings',
    \   'linter_errors': 'LightlineLinterErrors'
    \ },
    \ 'component_type': {
    \   'readonly': 'error',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error'
    \ }
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return printf('%d ✗', all_errors)
endfunction

autocmd User ALELint call lightline#update()

let g:delimitMate_expand_cr=1
let g:jsx_ext_required = 0

" Tern
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
autocmd FileType javascript,javascript.jsx setlocal omnifunc=tern#Complete

" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd FileType javascript,javascript.jsx nnoremap <silent> <buffer> gb :TernDef<CR>

" ALE
let g:ale_linters = {
\   'javascript': ['eslint', 'standard'],
\   'sh': ['shellcheck'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint', 'standard'],
\}
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
" hi ALEErrorSign ctermfg=196 ctermbg=NONE
" hi ALEWarningSign ctermfg=226

" use ag over grep
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore "node_modules" --ignore "**/docs/**" --ignore "**/dist/**" -g ""'
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
nnoremap <leader>P :Files <C-R>=expand('%:h')<CR><CR>

" Colors
" ----------------------
syntax enable           " enable syntax processing
if (has("termguicolors"))
  set termguicolors
endif
let base16colorspace=256
set background=dark
let g:seoul256_background = 237
" colorscheme seoul256
colorscheme onedark
set t_Co=16
set t_ut=
hi Normal guibg=NONE ctermbg=NONE
hi LineNr ctermfg=NONE ctermbg=NONE
hi VertSplit ctermbg=NONE guibg=NONE
hi GitGutterAdd guibg=NONE ctermbg=NONE
hi GitGutterChange guibg=NONE ctermbg=NONE
hi GitGutterDelete guibg=NONE ctermbg=NONE
hi GitGutterChangeDelete guibg=NONE ctermbg=NONE
hi def link jsObjectKey Label

" Spaces & Tabs
" ----------------------
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4        " indentation with << and >>
set expandtab           " tabs are spaces
set shiftround          " use multiple of shiftwidth when indenting with < and >
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
hi CursorLine ctermbg=NONE
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
" if has('nvim')
"   let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" endif
" auto highlight colors for these filetypes
let g:colorizer_auto_filetype='css,html,scss,less,json'
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50


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
autocmd BufRead,BufNewFile *.hbs set filetype=mustache


" Commands
" ----------------------
nnoremap \ :Ag! --ignore "**docs**" --ignore "**trader-gui-client**" --ignore "**dist**"<SPACE>
nnoremap # :Ag! --ignore "**docs**" --ignore "**trader-gui-client**" --ignore "**dist**"<SPACE>
map Q <Nop>
" paste date for notes
map <F3> :r! date +"\%a \%b \%d \%T \%Z \%Y \|\| \%s"<CR>
" remap ctrl+c to Esc becuase ctrl+c after typing comma, deletes the comma
vnoremap <C-c> <Esc>
nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>

" Leader Shortcuts
" ----------------------
let mapleader=","      " leader is comma

" Switch between last two files
map <leader><leader> <c-^>

" open gundo
nnoremap <leader>u :GundoToggle<CR>

" open nerdtree
nmap <leader>nt :NERDTreeToggle<CR>
" open nerdtree current file
nmap <leader>n :NERDTreeFind<CR>
" open nerdtree bookmark
nmap <leader>nb :NERDTreeFromBookmark<space>


" toggle indent
nmap <leader>tt :call ToggleIndent()<CR>

" toggle color highlighting
nmap <leader>c :ColorToggle<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" turn off search highlight
nnoremap <leader><space> :set hlsearch!<CR>

" toggle scrolloff between 999 and 0. 999 keeps line center screen
nnoremap <leader>zz :let &scrolloff=999-&scrolloff<CR>

" toggle paste mode
set pastetoggle=<leader>p

" select text that was jsut pasted
nnoremap <leader>v V`]
