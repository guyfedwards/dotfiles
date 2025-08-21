" =====================
" Plugins
" =====================
call plug#begin('~/.config/nvim/plugged')
Plug 'andymass/vim-matchup'
Plug 'chrisbra/Colorizer'
Plug 'danymat/neogen', {'branch': 'main'}
Plug 'dense-analysis/ale'
Plug 'folke/todo-comments.nvim', {'branch': 'main'}
Plug 'folke/trouble.nvim', {'branch': 'main'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc '}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'lewis6991/gitsigns.nvim', {'branch': 'main'}

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/cmp-cmdline', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'ray-x/go.nvim'
Plug 'ziglang/zig.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'

Plug 'sindrets/diffview.nvim', {'branch': 'main'}
Plug 'preservim/nerdtree'
Plug 'stevearc/oil.nvim'
Plug 'raimondi/delimitMate'
Plug 'mbbill/undotree'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" colorschemes
Plug 'neanias/everforest-nvim', { 'branch': 'main' }

" File type specific
" Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx', 'javascript.jsx', 'javascript.typescript'] }
" Plug 'elzr/vim-json', { 'for': ['json'] }
" Plug 'moll/vim-node', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
" Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
Plug 'alvan/vim-closetag', { 'for': ['html', 'jsx', 'javascript', 'javascript.jsx']}
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'MeanderingProgrammer/markdown.nvim', { 'for': 'markdown'}
call plug#end()

" =====================
" =====================
set nocompatible
set nobackup " disable auto backups and swap files
set backupcopy=yes "make a copy of the file and overwrite the original one
set confirm " allow unsaved buffers in background, but check on quit
set hidden
set noswapfile
set laststatus=2
set exrc
set backspace=2
set encoding=utf8
set undofile " tell it to use an undo file
set undodir=~/.vimundo/ " set a directory to store the undo history
set scrolloff=3 " offset scroll few lines before bottom
set mouse=a " mouse support
set lazyredraw " Don't redraw while executing macros (good performance config)
set timeoutlen=500
set relativenumber

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
" colorscheme tokyonight-day
" colorscheme tokyonight-night
set termguicolors

hi LineNr ctermfg=NONE ctermbg=NONE
hi VertSplit ctermbg=NONE guibg=#191E21 guifg=#293136
hi GitGutterAdd guibg=NONE ctermbg=NONE
hi GitGutterChange guibg=NONE ctermbg=NONE
hi GitGutterDelete guibg=NONE ctermbg=NONE
hi GitGutterChangeDelete guibg=NONE ctermbg=NONE
" transparent gutter
hi SignColumn guibg=NONE ctermbg=NONE
set signcolumn "yes"
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
set updatetime=300 " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c " don't give |ins-completion-menu| messages.

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
" open undotree
nnoremap <leader>u :UndotreeToggle<CR>
" open nerdtree
nmap <leader>nt :NERDTreeToggle<CR>
" open nerdtree current file
nmap <leader>nn :NERDTreeFind<CR>
" toggle color highlighting
nmap <leader>c :ColorToggle<CR>
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :tabnew $MYVIMRC <bar> :vnew $HOME/.config/nvim<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" toggle scrolloff between 999 and 0. 999 keeps line center screen
nnoremap <leader>zz :let &scrolloff=999-&scrolloff<CR>
" select text that was just pasted
nnoremap <leader>v V`]
nnoremap <leader>t :GoTestFunc -v<CR>
nnoremap <leader>T :GoTest -v<CR>



" =====================
" Plugin Settings
" =====================
" Ale
" =====================
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'javascript': ['eslint', 'standard'],
\   'lua': ['luacheck'],
\   'sh': ['shellcheck'],
\   'go': ['golangci-lint'],
\   'sql': ['sqlint'],
\   'typescript': ['eslint'],
\   'rust': ['analyzer'],
\   'proto': ['protolint']
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint', 'standard'],
\   'javascriptreact': ['prettier', 'eslint', 'standard'],
\   'typescriptreact': ['prettier', 'eslint', 'standard'],
\   'typescript': ['prettier', 'eslint', 'standard'],
\   'go': ['gopls'],
\   'lua': ['stylua'],
\   'json': ['fixjson'],
\   'sql': ['pgformatter'],
\   'rust': ['rustfmt'],
\   'terraform': ['terraform']
\}
let g:ale_rust_analyzer_config = {
\ 'diagnostics': { 'disabled': ['unresolved-import'] },
\ 'cargo': { 'loadOutDirsFromCheck': v:true },
\ 'procMacro': { 'enable': v:true },
\ 'checkOnSave': { 'command': 'clippy', 'enable': v:true }
\ }
let g:ale_javascript_eslint_executable='eslint_d'
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_sql_sqlfmt_executable='sqlfmt'
" let g:ale_sign_error = '●'
" let g:ale_sign_warning = '●'
" let g:ale_sign_column_always = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_completion_autoimport = 0
let g:ale_echo_msg_format = '%linter%:%code%: %s'
" we are using nvim-lsp
let g:ale_disable_lsp = 1
" enable linting package not just file
let g:ale_go_golangci_lint_package = 1
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
nnoremap <leader>ad :ALEDetail<cr>

" colorizer
" =====================
" auto highlight colors for these filetypes
let g:colorizer_auto_filetype='css,html,scss,less,json'


" delimitMate
" =====================
let g:delimitMate_expand_cr=1
au FileType xml,html,phtml,php,xhtml,js,jsx,ts,tsx,javascript,javascript.jsx let b:delimitMate_matchpairs = "(:),[:],{:}"

" fzf
" =====================
let g:fzf_layout = { 'down': '40%' }
nmap <C-p> :Files .<CR>
nmap <C-t> :Tags <CR>
nmap <C-b> :Buffers <CR>
nnoremap <leader>P :Files <C-R>=expand('%:h')<CR><CR>

"  NERDTree
" =====================
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let g:NERDTreeMinimalMenu=1
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

" vim-javascript
" =====================
let b:javascript_fold = 0

" vim-json
" =====================
let g:vim_json_syntax_conceal = 0

" vim-jsx
" =====================
let g:jsx_ext_required = 1

" vim-closetag
" =====================
let g:closetag_emptyTags_caseSensitive = 1
" let g:closetag_xhtml_filetypes = 'html,xhtml,javascript.jsx,jsx,javascript'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.tsx'

" vim-markdown
" =====================
let g:vim_markdown_new_list_item_indent = 0

" lua
lua require("config")
