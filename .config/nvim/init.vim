" syntax highlighting
syntax enable
syntax on

" compatibility with vi
set nocompatible

" indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" line wrapping
set wrap

" line number
set number
set relativenumber

" fix slow key combination
set ttimeoutlen=10

" disable temp files
set noswapfile
set nobackup
set nowritebackup

" disable mouse
set mouse=

" enable wildmenu
set wildmenu
set wildmode=full

" file browsing
let g:netrw_banner=0       " disable banner
let g:netrw_altv=1         " open splits to the right
let g:netrw_liststyle=3    " tree view

" find in subfolders
set path+=**

" buffers
set history=500

" status line
set laststatus=2                             " always show the status line
set statusline=                              " clear the statusline
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

