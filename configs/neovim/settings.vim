
"------------------------
"|  General Settings:   |
"------------------------

    "set termguicolors          " Using OSX/iterm turns colorschemes all pink
    set hidden
    set shell=/bin/zsh\ -l
    set ma                      " Modifiable
	set encoding=UTF-8			" Unicode support, required for devicons
	set nrformats=				" Treat all numberals as decimal
    set number
	"set relativenumber			" Numbers displayed relative to position
	set nowrap					" No text wrap
	"set lazyredraw				" Vim don't redraw the screen, macros need speed
    set clipboard^=unnamed

	set ignorecase				" Ignore case when searching
	set smartcase				" Use case when used
	set hlsearch				" Highlight searches by default
	set incsearch               " Incremental searching

	set autoindent
	set tabstop=4
	set shiftwidth=4
	set scrolloff=3				" Number of lines to keep above and below of cursor
	set expandtab

	set sidescrolloff=5			" Number of columns to keep left and right of cursor

	set noswapfile				" No more .swap files
	set nobackup				"
	set nowritebackup			" No write backup
	set undodir=-/.vim/undodir	" Undo directory location
	"set viminfo=""				" Disable viminfo file

	set noerrorbells			" Disable bell sound
	set visualbell t_vb=		" Disable bell sound, enable visual

	set splitright				" Window split to the right

    setlocal define=^#\\s*

    set spelllang=en
    set complete+=kspell
    set spellfile=$HOME/notes/en.utf-8.add      " Personal dictionary

    set backspace=indent,eol,start              "backspace fix in OSX

    " Change Leader
    let mapleader=","


