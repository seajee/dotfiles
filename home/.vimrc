" Set <space> as the leader key
let mapleader = " "
let maplocalleader = " "

" [[ Setting options ]]

" Fat cursor
set guicursor=

" Make relative line numbers default
set number
set relativenumber

" Use 4 spaces as tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Smart indentation
set smartindent

" Enable mouse mode
set mouse=a

" Don't show the mode, since it's already in the status line
" set noshowmode

" Enable break indent
set breakindent

" Save undo history
set undofile
let &undodir = $HOME . "/.vim/undodir"
set noswapfile
set nobackup

" Case-insensitive searching UNLESS \C or one or more capital letters in the search term
set ignorecase
set smartcase

" Incremental search
set incsearch

" Keep signcolumn on by default
set signcolumn=yes
set colorcolumn=79

" Decrease update time
set updatetime=250

" Decrease mapped sequence wait time
" Displays which-key popup sooner
set timeoutlen=300

" Configure how new splits should be opened
set splitright
set splitbelow

" Sets how Vim will display certain whitespace characters in the editor
set nolist
set listchars=tab:»\ ,space:·,trail:·,nbsp:␣

" Preview substitutions live, as you type!
" set inccommand=nosplit

" Show which line your cursor is on
set nocursorline

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=0

" [[ Keymaps ]]

" Set highlight on search, but clear on pressing <Esc> in normal mode
set hlsearch
nnoremap <Esc> :nohlsearch<CR>

" Netrw
nnoremap <leader>pv :Ex<CR>

" Move through quick fixes
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" Move text in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Center screen with Vim motions
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" System clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

" Delete without copying
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Delete all marks
nnoremap <leader>dm :delmarks!<CR>

" Toggle listchars
nnoremap <leader>lc :set list<CR>
nnoremap <leader>ln :set nolist<CR>

" Make executable
nnoremap <leader>x :!chmod +x %<CR>

" Change CWD for current tab
nnoremap <leader>cd :cd %:h \| pwd<CR>

" Tabs
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>tw :tabc<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>tr :tabr<CR>
nnoremap <leader>tl :tabl<CR>

" Buffers
nnoremap <leader>bc :enew<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

" Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
tnoremap <Esc><Esc> <C-\><C-n>

" [[ Colorscheme ]]
syntax on
colorscheme GruberDarker

" [[ GVim options ]]

" Gui options
set guioptions-=T
set guifont=Iosevka\ 14
