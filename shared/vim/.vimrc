
" Last updated: 09.04.19
"
"
"   ██╗██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"   ██║██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"   ██║██║   ██║██║██╔████╔██║██████╔╝██║
"   ██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"██╗██║ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"
"-----------------------
"|  Pluging Manager:   |
"-----------------------
"
    set nocompatible
    filetype off

    " Runtime path, include Vundle and initialize
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()

    "Plugin 'https://github.com/yegappan/mru.git'
    "Plugin 'jiangmiao/auto-pairs'
    Plugin 'VundleVim/Vundle.vim'

    "Eye Candy
    Plugin 'mhinz/vim-startify'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'roxma/nvim-yarp'
    Plugin 'roxma/vim-hug-neovim-rpc'
    Plugin 'yuttie/comfortable-motion.vim'

    "Navigation Tools
    Plugin 'scrooloose/nerdtree'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'kien/ctrlp.vim'
    Plugin 'francoiscabrol/ranger.vim'
    Plugin 'rbgrouleff/bclose.vim'

    "Writing Tools
    Plugin 'yggdroot/indentLine'
    Plugin 'junegunn/limelight.vim'
    Plugin 'junegunn/goyo.vim'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'bronson/vim-trailing-whitespace'
    Plugin 'reedes/vim-pencil'
    Plugin 'previm/previm'

    "Colorschemes
    Plugin 'drewtempelmeyer/palenight.vim'
    Plugin 'sainnhe/vim-color-forest-night'
    Plugin 'lifepillar/vim-solarized8'
    Plugin 'crusoexia/vim-dracula'

    Plugin 'skywind3000/quickmenu.vim'
    Plugin 'pseewald/vim-anyfold'
    Plugin 'aaronbieber/vim-quicktask'
    Plugin 'tpope/vim-unimpaired'
    Plugin 'tpope/vim-vinegar'
    Plugin 'dhruvasagar/vim-table-mode'
    Plugin 'airblade/vim-gitgutter'

    "Dev Tools
    Plugin 'zchee/deoplete-jedi'
    Plugin 'Shougo/deoplete.nvim'

    "Python Tools
    Plugin 'vim-scripts/indentpython.vim'
    Plugin 'vim-syntastic/syntastic'
    Plugin 'nvie/vim-flake8'

    "School Tools
    Plugin 'sk1418/HowMuch'
    Plugin 'sotte/presenting.vim'
    Plugin 'vim-scripts/DrawIt'
    Plugin 'segeljakt/vim-isotope'

    " All of your Plugins must be added before the following line

    call vundle#end()            " required
    filetype plugin indent on    " required

    " To ignore plugin indent changes, instead use:
    " filetype plugin on
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just
    " :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to
    " auto-approve removal

"------------------------
"|  General Settings:   |
"------------------------

    "set termguicolors          " Using OSX/iterm turns colorschemes all pink

    set guifont=Fira\ Code:h12

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
    set smartindent
	set tabstop=4
	set shiftwidth=4
	set scrolloff=3				" Number of lines to keep above and below of cursor
	set expandtab

	set sidescrolloff=5			" Number of columns to keep left and right of cursor

	set noswapfile				" No more .swap files
	set nobackup				"
	set nowb					" No write backup
	set undodir=-/.vim/undodir	" Undo directory location
	"set viminfo=""				" Disable viminfo file

	set noerrorbells			" Disable bell sound
	set vb t_vb=				" Disable bell sound, enable visual

	set splitright				" Window split to the right

    setlocal define=^#\\s*

    set spelllang=en
    set complete+=kspell
    set spellfile=$HOME/notes/en.utf-8.add

    set backspace=indent,eol,start "backspace fix in OSX

"------------------------------------------
"|   Remapping / Mapping / Abbreviation:  |
"------------------------------------------

    " Change Leader
    let mapleader=","

    " gd over a path opens directory
    nnoremap <leader>gd :Ex <cfile><CR>

    " move among buffers with CTRL
    nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
    nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

    " remap <esc> to jj
    inoremap jj <Esc>

    " Vim open Directory file at launch:
    "autocmd VimEnter * edit $HOME/notes/Index.md

    " Keyboard Shortcut
    nnoremap <C-i> :e $HOME/notes/Index.md<cr>

    " Move visual selection
    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '>-2<CR>gv=gv

    " gf new file under cursor
    nnoremap <leader>gf :e ~/notes/<cfile><CR>

    " Windown jumpimng
    nnoremap <C-H> <C-W><C-H>
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>

    " Swapped ; and : to increase speed, no need to use shift.
    nnoremap ; :
    nnoremap : ;

    " Insert current date and time
    nnoremap ,tt "=strftime("%c")<CR>P
    inoremap ,tt <C-R>=strftime("%c")<CR>

    " <3 vim: Take me to my love
    " nnoremap <C-V> :e ~/.vimrc<CR>

    " Helper file:
    " nnoremap <C-t> :vs ~/notes/Index_Helper.markdown<CR>:vertical resize 35<CR>

    " Work Soap Notes
        "nnoremap <C-s> :tabnew <esc>i#About<CR><CR>#Bodywork<CR><CR>#Other<CR>+ <C-R>=strftime("%m.%d.%y")<CR> - 60m - ##<esc>:w ~/notes/Work/Clients.Massage.Envy/.md<left><left><left>

    " Current_date
        iab zdt <c-r>=strftime("%m.%d.%y")<CR>

    " Vimgrep Shortcut w/ :lopen automated
    augroup myvimrc
        autocmd!
        autocmd QuickFixCmdPost [^l]* cwindow
        autocmd QuickFixCmdPost l*    lwindow
    augroup END

    " Search all file for a string
        nnoremap <leader>f :lvimgrep! // ** <left><left><left><left><left>

    " Vim Help in full screen
        nnoremap <C-h> :help  <bar> only <left><left><left><left><left><left><left><left>

    " Rot-13 the screen
        map <leader>r mzHVLg?`z

    " Spelling error I'm feeling lucky
        function! FixSpellingError()
            normal! mm[s1z=`m
        endfunction
        nnoremap <leader>sp :call FixSpellingError()<cr>

    " Source TODO
        "nnoremap <leader>so source $MYVIMRC<cr>

    " School Remapping


        " Calculator
            ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
        " arrow
            iab aup [↑]
            iab adown [↓]
            iab ^^ [⇅]


      "FixWhitespace shortcut TODO
      nnoremap <leader>ff command! FixWhitespace<CR>
      "
    " C-l redraws screen & removes highlight
        nnoremap <silent> <C-l> :nohl<CR><C-l>


    "Remove Trailing whitespace on save
        autocmd BufWrite * :%s/\s\+$//e

"----------------
"|   Plugins    |
"----------------
    "
    "Previm
        " Open Safari to provide preview
        let g:previm_open_cmd = 'open -a Safari'

    "Xpdf
        :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
        :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
        "
        "
    "Ranger Vim
    "
        "Disable Default mapping
        let g:ranger_map_keys = 0

        "New mapping:
        map <leader>r :Ranger<CR>.

    "NERDTree
        "Toggle NERDTree
        nnoremap <silent> <expr> <F6> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

        "Automatically open file for edit
        let NERDTreeQuitOnOpen=1

        "Show hidden files
        let NERDTreeShowHidden=1

    "aVim-isotope:
        "Convert next character into Superscript
        " <C-g><C-k> {char}
        "
        " Convert next character into Subscript
        " <C-g><C-j> {char}
        "
    "Airline:
        let g:airline_theme='minimalist'
        "
    "Deopelte:
        let g:deoplete#enable_at_startup = 1

        " Tab complete
        inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

        " Flake 8 / Linter
        "let g:python3_host_prog = '/usr/bin/nvim/bin/python3'
        "
        "
    "ComfortablMotionVim:
        " Mapping
           " Default maping <C-d> and <C-u>
           "
    " HowMuch:
       " Precisions of float calculations, default is 2
            let g:HowMuch_scale = 6
        " Define Engine
            let g:HowMuch_auto_engines = ['vim']
            "
    " Quickmenu:
        if !empty(glob('$HOME/.vim/bundle/quickmenu.vim/'))

             " enable cursorline (L) and cmdline help (H)
             let g:quickmenu_options = "LH"

             " clear all the items
             call g:quickmenu#reset()

             " remapping
             noremap <leader>m :call quickmenu#toggle(0)<cr>

             " section 1, text starting with "#" represents a section (see the screen capture below)
             call g:quickmenu#append('# Develop', '')

             call g:quickmenu#append('item 1.1', 'echo "1.1 is selected"', 'select item 1.1')
             call g:quickmenu#append('item 1.2', 'echo "1.2 is selected"', 'select item 1.2')
             call g:quickmenu#append('item 1.3', 'echo "1.3 is selected"', 'select item 1.3')

             " section 2
             call g:quickmenu#append('# Misc', '')

             call g:quickmenu#append('item 2.1', 'echo "2.1 is selected"', 'select item 2.1')
             call g:quickmenu#append('item 2.2', 'echo "2.2 is selected"', 'select item 2.2')
             call g:quickmenu#append("Turn fold %{&fen? 'off':'on'}", "set fold!", "enable/disable fold check (:set fen!)")
             call g:quickmenu#append("Turn spell %{&spell? 'off':'on'}", "set spell!", "enable/disable spell check (:set spell!)")
        else
            echom 'Not Installed, Quickmenu'
        endif

	" Vim Markdown:
		let g:markdown_enable_folding = 0 					" Folding
		let g:markdown_enable_spell_checking = 0			" Disable spell checking

		au FileType markdown setlocal nofoldenable	        "no folding in markdown

	" Presenting Vim:
		" Start Presenting <:PresentingStart> or <Presenting>
		" Navigate Presentation <n, p , q >
		" Slide Separator in markdown <#>

	" Drawit:
		" Start <Leader>di
		" Stop <Leader>ds

	" Goyo Limeline:
		" Limeline Color name (:help cterm-colors) or ANSI code
		let g:limelight_conceal_ctermfg = 'gray'
		let g:limelight_conceal_ctermfg = 240

		" Goyo & Limeline intergration TODO needed?
			" autocmd! User GoyoEnter Limelight
			" autocmd! User GoyoLeave Limelight!

		" Enter Goyo Settings:

			function! s:Goyo_Enter()
  				TogglePencil
				Limelight
			endfunction

			function! s:Goyo_Leave()
    			TogglePencil
			endfunction

			autocmd! User GoyoEnter nested call <SID>Goyo_Enter()
			autocmd! User GoyoLeave nested call <SID>Goyo_Leave()

	" Vim Pencil:
		" Activated with Goyo, auto detects wrap and hardlines breaks

	" Vim_Anyfold:
		let AnyfoldActivate=1
		set foldlevel=0

	" CtrlP:
		" Invoke CtrlP
			 let g:ctrlp_map = '<C-p>'	"aka Command-P
			 let g:ctrlp_cmd = 'CtrlP'
			 let g:ctrlp_match_window = 'top,order:btt,min:1,max:10,results:10'

	" Netrw:
        " Default Directory
			"let g:notes_directories = ['~/notes', '~/Dropbox/Shared notes']

		" Default file extentsion
			let g:notes_suffix = '.md'

	" Autopairs:
		" Default settings used.

    " Unimpaired:
	    " Useful mapping for navigating :vimgrep results
		 	"<[q> to <cprevious>
		 	"<q]> to <cnext>


    " IndentLine:
        " Change indent char
            let g:indentLine_char = '|'

"---------------
"| Apperance:  |
"---------------

    " Set Vim-specific sequences for RGB colors
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum""

	" Colorschemes:

        	" Dracula:
           	 fun! s:Dra()
                	colorscheme dracula
                	set background=dark
                	syntax on
            endfun
            command Dra call s:Dra()

		" Palenight:
		    fun! s:Pale()
                set background=dark
                colorscheme palenight
            endfun
            command Pale call s:Pale()

		" Soltarize:
            function! s:Sold()
			    set background=dark
			    colorscheme solarized8_high
            endfunction
            command Sold call s:Sold()

            function! s:Soll()
                set background=light
                colorscheme solarized8
            endfunction
            command Soll call s:Soll()

	"Statusline:

        " Non-Powerline
        "set laststatus =2                       "show sttaus line
		"set statusline +=%1*\ %n\ %*            "buffer number
		"set statusline +=%5*%{&ff}%*            "file format
		"set statusline +=%3*%y%*                "file type
		"set statusline +=%4*\ %<%F%*            "full path
		"set statusline +=%2*%m%*                "[+] will if current buffer is modified
		"set statusline +=%1*%=%5l%*             "current line
		"set statusline +=%2*/%L%*               "total lines
		"set statusline +=%1*%4v\ %*	            "virtual column number
		"set statusline +=%{strftime('%-I:%M')}	"time in 12h format

	" Syntax:
        " File type *markdown
		    "autocmd! bufreadpost *.markdown set syntax=off
        "
        " File type *.md
            "augroup md_settings " {
                "autocmd!
                "autocmd BufNewfile,BufRead md set syntax on
                "autocmd BufNewfile,BufRead md set linebreak
                "autocmd BufNewfile,BufRead md set wrap
                "autocmd BufNewfile,BufRead md setlocal spell
            "augroup END " }

        " Highlight TODO FIXME NOTE OPTIMIZE & FYI
            syn match myTodo contained "\<\(FIXME\|NOTE\|TODO\|OPTIMIZE\|FYI\):"
            hi def link myTodo Todo
            "
