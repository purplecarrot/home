""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax highlighting
syntax on
filetype plugin on
set background=dark

" General
set pastetoggle=<F2>
set scrolloff=5
set encoding=utf-8

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set cindent
set showcmd
set showmatch

" Indentation
set autoindent
set smartindent
set shiftwidth=4

" Prefer backups in one place
set backup
set backupdir=$HOME/.vim/backup

" Any local system overrides
if filereadable('.vimrc_local')
    execute 'source .vimrc_local'
endif

