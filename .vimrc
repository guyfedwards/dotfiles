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
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'chrisbra/Colorizer'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'lokaltog/vim-monotone'
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'raimondi/delimitMate'
Plug 'reedes/vim-colors-pencil'
Plug 'preservim/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-multiple-cursors'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'dense-analysis/ale'

" File type specific
" Docker
Plug 'honza/dockerfile.vim', { 'for': ['dockerfile'] }
" Elixir
Plug 'elixir-editors/vim-elixir', { 'for': ['elixir'] }
" Go
Plug 'fatih/vim-go', { 'for': ['go'], 'do': ':GoInstallBinaries' }
" JavaScript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx', 'javascript.jsx', 'javascript.typescript'] }
Plug 'elzr/vim-json', { 'for': ['json'] }
Plug 'moll/vim-node', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript.jsx'] }
Plug 'styled-components/vim-styled-components', { 'for': ['javascript', 'jsx', 'javascript.jsx'], 'branch': 'main' }
" Markdown
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Rust
Plug 'rust-lang/rust.vim', { 'for': ['rust', 'rs'] }
" Terraform
Plug 'hashivim/vim-terraform'
" TypeScript
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['ts', 'typescript', 'tsx', 'javascript.typescript'] }
call plug#end()

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

if executable('rg')
  " Use rg over grep
  set grepprg=rg\ --vimgrep
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
"
" Inside
let g:seoul256_background = 237
colorscheme seoul256
"
" Outside
" colorscheme pencil
" set background=light
" let g:pencil_higher_contrast_ui = 1

" colorscheme hybrid_material
" set background=light

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
hi def link typescriptEndColons Normal


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
" custom file type for .*rc files if no file type detected
au BufRead,BufNewFile .*rc setfiletype json
" markdown formatting for .md files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *config set filetype=config


" =====================
" Commands
" =====================
nnoremap \ :Rg<SPACE>
map Q <Nop>
" paste date for notes
map <F3> :.-1r! date +"\%a \%b \%d \%T \%Z \%Y \|\| \%s"<CR>
" remap ctrl+c to Esc because ctrl+c after typing comma, deletes the comma
vnoremap <C-c> <Esc>
nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>


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



" =====================
" Plugin Settings
" =====================
" Ale
" =====================
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'sh': ['shellcheck'],
\   'go': ['gometalinter'],
\   'sql': ['sqlint']
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'json': ['fixjson'],
\   'sql': ['sqlfmt'],
\   'rust': ['rustfmt'],
\   'terraform': ['terraform']
\}
let g:ale_javascript_eslint_executable='eslint_d'
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_sql_sqlfmt_executable='sqlfmt'
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_echo_msg_format = '%linter%:%code%: %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
nnoremap <leader>ad :ALEDetail<cr>

" CoC.nvim
" =====================
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" jump to next placeholder
let g:coc_snippet_next = '<tab>'
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
call coc#config('diagnostic.displayByAle', 1)
call coc#config('snippets.loadFromExtensions', 0)
call coc#config('snippets.priority', 100)
call coc#config('suggest.maxCompleteItemCount', 20)
call coc#config('tsserver.enable', 0)
let s:languageserver = {}
if executable('gopls')
  let s:languageserver["golang"] = {
        \   "command": "gopls",
        \   "rootPatterns": ["go.mod", ".vim/", ".git/", ".hg/"],
        \   "filetypes": ["go"]
        \ }
endif
call coc#config('languageserver', s:languageserver)
nmap <leader>gt  <Plug>(coc-type-definition)<CR>
nmap <leader>gd  <Plug>(coc-definition)<CR>
nmap <leader>gr  <Plug>(coc-reference)<CR>
nmap <leader>rn  <Plug>(coc-rename)

" colorizer
" =====================
" auto highlight colors for these filetypes
let g:colorizer_auto_filetype='css,html,scss,less,json'

" delimitMate
" =====================
let g:delimitMate_expand_cr=1

" fzf
" =====================
let g:fzf_layout = { 'down': '40%' }
nmap <C-p> :Files .<CR>
nmap <C-t> :Tags <CR>
nmap <C-b> :Buffers <CR>
nnoremap <leader>P :Files <C-R>=expand('%:h')<CR><CR>

" lightline
" =====================
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

"  NERDTree
" =====================
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" set the color for files ending with _spec.r
" this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {}
let g:NERDTreePatternMatchHighlightColor['.*\.rb$'] = 'a9535b'
let g:NERDTreePatternMatchHighlightColor['.*\.go$'] = '5485e5'
" autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter,TabEnter * wincmd p

" SQL
" =====================
let g:ftplugin_sql_omni_key = 'C-j'

" vim-go
" =====================
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

" vim-javascript
" =====================
let b:javascript_fold = 0

" vim-json
" =====================
let g:vim_json_syntax_conceal = 0

" vim-jsx
" =====================
let g:jsx_ext_required = 1

