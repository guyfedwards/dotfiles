" =====================
" Plug Auto-Update
" =====================
if empty(glob('~/.vim/autoload/plug.vim'))
    if has('nvim')
        silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
endif


" =====================
" Plugins
" =====================
call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/Colorizer'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'scrooloose/nerdtree'
Plug 'sirver/ultisnips'
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'

" Filetype specific
" Go
Plug 'fatih/vim-go', { 'for': ['go'], 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'for': ['go'], 'do': 'make' }
" HTML
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'eruby', 'mustache', 'handlebars', 'hbs', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
" Rust
Plug 'rust-lang/rust.vim', { 'for': ['rust', 'rs'] }
" JavaScript
Plug 'flowtype/vim-flow', { 'for': ['javascript', 'js', 'jsx', 'javascript.jsx']}
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'jsx', 'javascript.jsx'], 'on': 'JsDoc' }
Plug 'leshill/vim-json', { 'for': ['json'] }
Plug 'moll/vim-node', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'jsx', 'javascript.jsx']}
Plug 'styled-components/vim-styled-components', { 'for': ['javascript', 'jsx', 'javascript.jsx'], 'branch': 'main' }
Plug 'ternjs/tern_for_vim', { 'for': ['js', 'javascript', 'javascript.jsx'], 'do': 'npm install'}
" Markdown
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Ruby
Plug 'tpope/vim-rails', { 'for': ['ruby'] }
call plug#end()
" SQL
let g:ftplugin_sql_omni_key = 'C-j'



" =====================
" General
" =====================
set nocompatible
set nobackup " disable auto backups and swap files
set confirm " allow unsaved buffers in background, but check on quit
set hidden
set noswapfile
set laststatus=2
set backspace=2
set encoding=utf8
set undofile " tell it to use an undo file
set undodir=~/.vimundo/ " set a directory to store the undo history
set scrolloff=3 " offset scroll few lines before bottom
set mouse=a " mouse support
set lazyredraw " Don't redraw while executing macros (good performance config)

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" trim whitespace
fun! StripTrailingWhiteSpace()
  " don't strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
autocmd bufwritepre * :call StripTrailingWhiteSpace()


" =====================
" Colors
" =====================
syntax enable
let base16colorspace=256
set background=dark
let g:seoul256_background = 237
colorscheme seoul256
set t_Co=256
set t_ut=
hi Normal guibg=NONE ctermbg=NONE
hi LineNr ctermfg=NONE ctermbg=NONE
hi VertSplit ctermbg=NONE guibg=NONE
hi GitGutterAdd guibg=NONE ctermbg=NONE
hi GitGutterChange guibg=NONE ctermbg=NONE
hi GitGutterDelete guibg=NONE ctermbg=NONE
hi GitGutterChangeDelete guibg=NONE ctermbg=NONE
" transparent gutter
hi SignColumn guibg=NONE ctermbg=NONE
" transparent line numbers
hi LineNr guibg=NONE ctermbg=NONE
hi def link jsObjectKey Label


" =====================
" Spaces & Tabs
" =====================
set tabstop=2           " number of visual spaces per TAB
set softtabstop=2       " number of spaces in tab when editing
set shiftwidth=2        " indentation with << and >>
set expandtab           " tabs are spaces
set shiftround          " use multiple of shiftwidth when indenting with < and >
set autoindent          " autoindent lines
set copyindent          " copy the indentation on autoindenting


" =====================
" UI Config
" =====================
set number              " show line numbers
set cursorline          " highlight current line
hi CursorLine ctermbg=237
filetype indent plugin on " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set ruler               " line/character numbers bottom right
set colorcolumn=81      " show line at 81 chars, stop before the line
" change cursor in different modes
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50

" =====================
" Searching
" =====================
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,
                        " case-sensitive otherwise


" =====================
" Folding
" =====================
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level


" =====================
" Movement
" =====================
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]


" =====================
" Window Management
" =====================
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Open new panes to right and bottom
set splitbelow
set splitright


" =====================
" Syntax related
" =====================
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
" custom filetype for .*rc files if no filetype detected
au BufRead,BufNewFile .*rc setfiletype json
" markdown formatting for .md files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *config set filetype=config


" =====================
" Commands
" =====================
nnoremap \ :Ag<SPACE>
map Q <Nop>
" paste date for notes
map <F3> :.-1r! date +"\%a \%b \%d \%T \%Z \%Y \|\| \%s"<CR>
" remap ctrl+c to Esc becuase ctrl+c after typing comma, deletes the comma
vnoremap <C-c> <Esc>
nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>


" =====================
" Leader Shortcuts
" =====================
let mapleader=","
" Switch between last two files
map <leader><leader> <c-^>
" open gundo
nnoremap <leader>u :GundoToggle<CR>
" open nerdtree
nmap <leader>nt :NERDTreeToggle<CR>
" open nerdtree current file
nmap <leader>n :NERDTreeFind<CR>
nmap <leader>nn :NERDTreeFind<CR>
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
" select text that was just pasted
nnoremap <leader>v V`]
" golang go to definition
autocmd FileType go nmap <buffer> <leader>gd  :GoDef<CR>
autocmd FileType javascript,javascript.jsx nmap <buffer> <leader>gd  :FlowJumpToDef<CR>



" =====================
" Plugin Settings
" =====================
"  NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" set the color for files ending with _spec.r
" this line is needed to avoid errorb
let g:NERDTreePatternMatchHighlightColor = {}
let g:NERDTreePatternMatchHighlightColor['.*\.rb$'] = 'a9535b'
let g:NERDTreePatternMatchHighlightColor['.*\.go$'] = '5485e5'
" open by default
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter,TabEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter,TabEnter * wincmd p

" vim-javascript
let b:javascript_fold = 0
let g:javascript_plugin_flow = 1

" vim-flow
"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif
let g:flow#showquickfix = 0 " disable quickfix as have ALE

" vim-go
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "locationlist"
let g:go_fmt_fail_silently = 1
let g:go_metalinter_enabled = [
      \ 'deadcode', 'errcheck', 'gas', 'goconst', 'golint', 'gosimple',
      \ 'gotype', 'ineffassign', 'interfacer', 'staticcheck', 'structcheck',
      \ 'unconvert', 'varcheck', 'vet', 'vetshadow',
      \ ]

" lightline
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ 'active': {
    \   'right': [[ 'lineinfo' ], [ 'percent' ], [ 'filetype' ], [ 'linter_warnings', 'linter_errors' ]]
    \ },
    \ 'component': {
    \     'lineinfo': '%3l/%L:%-2v',
    \     'filename': '%f'
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
autocmd User ALELint call lightline#update() " refresh after lint

" delimitMate
let g:delimitMate_expand_cr=1

" vim-jsx
let g:jsx_ext_required = 0

" Tern
let g:tern_show_signature_in_pum = 1
autocmd FileType javascript,javascript.jsx setlocal omnifunc=tern#Complete
autocmd FileType javascript,javascript.jsx nnoremap <silent> <buffer> gb :TernDef<CR>

" Ale
let g:ale_javascript_eslint_executable='eslint_d'
let g:ale_sql_sqlfmt_executable='sqlfmt'
let g:ale_javascript_eslint_use_global = 1
let g:ale_linters = {
\   'javascript': ['eslint', 'flow', 'standard'],
\   'sh': ['shellcheck'],
\   'go': ['gometalinter'],
\   'sql': ['sqlint']
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint', 'standard'],
\   'json': ['fixjson'],
\   'sql': ['sqlfmt'],
\   'rust': ['rustfmt']
\}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_echo_msg_format = '%linter%: %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" Limelight
let g:limelight_conceal_ctermfg = 240

" JSDoc
let g:javascript_plugin_jsdoc = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_additional_descriptions = 1
let g:jsdoc_enable_es6 = 1

" fzf
nmap <C-p> :Files .<CR>
nmap <C-t> :Tags <CR>
nmap <C-b> :Buffers <CR>
nnoremap <leader>P :Files <C-R>=expand('%:h')<CR><CR>

" deoplete
call deoplete#custom#source('_', 'converters', ['converter_remove_overlap', 'converter_truncate_abbr', 'converter_truncate_menu', 'converter_auto_paren'])
" enable deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
" Disable Deoplete when selecting multiple cursors starts
function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete = 1
endfunction
" Enable Deoplete when selecting multiple cursors ends
function! Multiple_cursors_after()
  let b:deoplete_disable_auto_complete = 0
endfunction
" deoplete go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

" colorizer
" auto highlight colors for these filetypes
let g:colorizer_auto_filetype='css,html,scss,less,json'

