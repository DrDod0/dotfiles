"
" Author: @veggietorta
" Last updated: 03.26.21
" Location $HOME/


"   ██╗██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"   ██║██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"   ██║██║   ██║██║██╔████╔██║██████╔╝██║
"   ██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"██╗██║ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝


"-----------------------
"|  Pluging Manager:   |
"-----------------------

    call plug#begin()

    "Eye Candy
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'yuttie/comfortable-motion.vim'

    "Navigation Tools
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    "Writing Tools
    Plug 'yggdroot/indentLine'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'xolox/vim-notes'
    Plug 'xolox/vim-misc'
    Plug 'dkarter/bullets.vim'


    "Colorschemes
    Plug 'crusoexia/vim-dracula'
    Plug 'owozsh/amora'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-vinegar'
    Plug 'airblade/vim-gitgutter'

    "Dev Tools
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
    Plug 'voldikss/vim-floaterm'
    Plug 'vim-test/vim-test'

    "Python Tools
    Plug 'tpope/vim-fugitive'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'nvie/vim-flake8'
    Plug 'jeetsukumaran/vim-pythonsense'
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'Vimjas/vim-python-pep8-indent'


    call plug#end()


"------------------------
"|  General Settings:   |
"------------------------

    set shell=/bin/zsh\ -l
    set ma                      " Modifiable
	set encoding=UTF-8			" Unicode support, required for devicons
	set nrformats=				" Treat all numberals as decimal
    set number
	set relativenumber			" Numbers displayed relative to position
	set nowrap					" No text wrap
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
	set nobackup
	set nowritebackup			" No write backup
	set undodir=-/.vim/undodir	" Undo directory location
	set noerrorbells			" Disable bell sound
	set visualbell t_vb=		" Disable bell sound, enable visual
	set splitright				" Window split to the right
    set signcolumn=number       " Display signs in the number columns

    setlocal define=^#\\s*

    set spelllang=en
    set complete+=kspell
    set spellfile=$HOME/notes/en.utf-8.add      " Personal dictionary

    " Change Leader
    let mapleader=","


"------------------------------------------
"|   Remapping / Mapping / Abbreviation:  |
"------------------------------------------

    "Remap window navigation in Any modde
        :tnoremap <C-h> <C-\><C-N><C-w>h
        :tnoremap <C-j> <C-\><C-N><C-w>j
        :tnoremap <C-k> <C-\><C-N><C-w>k
        :tnoremap <C-l> <C-\><C-N><C-w>l
        :inoremap <C-h> <C-\><C-N><C-w>h
        :inoremap <C-j> <C-\><C-N><C-w>j
        :inoremap <C-k> <C-\><C-N><C-w>k
        :inoremap <C-l> <C-\><C-N><C-w>l
        :nnoremap <C-h> <C-w>h
        :nnoremap <C-j> <C-w>j
        :nnoremap <C-k> <C-w>k
        :nnoremap <C-l> <C-w>l

    "Send current line to other tmux panes in the same window
        nnoremap <silent> <leader>p :call SendLineToPanes()<cr>
        function! SendLineToPanes()
            let cmd="echo '" . getline('.') . "' | ~/dotfiles/configs/tmux/tmux_send.sh"
            silent call system(cmd)
        endfunction

    "gd over a path opens directory
        nnoremap <leader>gd :Ex <cfile><CR>

    "Move among buffers with CTRL
        nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
        nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

    "remap <esc> to jj
        inoremap jj <Esc>

    "Move visual selection
        vnoremap J :m '>+1<CR>gv=gv
        vnoremap K :m '>-2<CR>gv=gv

    "gf new file under cursor
        nnoremap <leader>gf :e ~/notes/<cfile><CR>

    "Windown jumpimng
        nnoremap <C-H> <C-W><C-H>
        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>

    "Swapped ; and : to increase speed, no need to use shift.
        nnoremap : ;
        nnoremap ; :

    "Insert current date with 'zdt'
        iab zdt <c-r>=strftime("%m.%d.%y")<CR>

    "Search all file for a string
        nnoremap <leader>f :lvimgrep! // ** <left><left><left><left><left>

    "Spelling error I'm feeling lucky
        function! FixSpellingError()
            normal! mm[s1z=`m
        endfunction
        nnoremap <leader>sp :call FixSpellingError()<cr>

    "Leader-h redraws screen & removes highlight
        nnoremap <leader>h :nohl<CR>

    "Remove Trailing whitespace on save
        autocmd BufWrite * :%s/\s\+$//e


"----------------
"|   Plugins    |
"----------------


    "Vim Test:
        " these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
            nmap <silent> t<C-n> :TestNearest<CR>
            nmap <silent> t<C-f> :TestFile<CR>
            nmap <silent> t<C-s> :TestSuite<CR>
            nmap <silent> t<C-l> :TestLast<CR>
            nmap <silent> t<C-g> :TestVisit<CR>





    " Vimpythonpep8indent:
        "closing brackets line up with the items:
        let g:python_pep8_indent_hang_closing = 1

    " Fzf:
        let g:fzf_action = {
              \ 'ctrl-s': 'split',
              \ 'ctrl-v': 'vsplit'
              \ }

        nnoremap <c-p> :FZF<cr>

        augroup fzf
          autocmd!
          autocmd! FileType fzf
          autocmd  FileType fzf set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
        augroup END

    " Vim Floaterm:
        "Float position
            let g:floaterm_position = 'topright'

        "Key binding F12 to toggle
            noremap  <silent> <F12>           :FloatermToggle<CR>
            noremap! <silent> <F12>           <Esc>:FloatermToggle<CR>
            tnoremap <silent> <F12>           <C-\><C-n>:FloatermToggle<CR>

    " Cocvim:
        " Use tab for trigger completion with characters ahead and navigate.
        " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
        inoremap <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

    " Airline:
        let g:airline_theme='minimalist'
        "

    " ComfortablMotionVim:
        "Mapping
           " Default maping <C-d> and <C-u>

    " Vim Markdown:
		let g:markdown_enable_spell_checking = 0			" Disable spell checking
		au FileType markdown setlocal nofoldenable	        "no folding in markdown


    " Vim Note:
        "let g:notes_directories = ['~/home/dev/notes']
        "let g:notes_suffix = '.md'


	" Goyo Limeline:
		"Limeline Color name (:help cterm-colors) or ANSI code
		let g:limelight_conceal_ctermfg = 'pink'
		let g:limelight_conceal_ctermfg = 240


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

	" Netrw:
        "Default Directory
			"let g:notes_directories = ['~/notes', '~/Dropbox/Shared notes']

		"Default file extentsion
			let g:notes_suffix = '.md'

	" Autopairs:
		"Default settings used.

    " IndentLine:
        "Change indent char
            let g:indentLine_char = '|'

    " Vimgutter:
        "Update time
        set updatetime=100

        "Customise symbol
        let g:gitgutter_sign_added = ''
        let g:gitgutter_sign_modified = ''
        let g:gitgutter_sign_removed = ''
        "let g:gitgutter_sign_removed_first_line = '^^'
        "let g:gitgutter_sign_modified_removed = 'ww'


"---------------
"| Apperance:  |
"---------------

    " In GIT Branch
        silent! !git rev-parse --is-inside-work-tree
        if v:shell_error == 0
            noremap <C-p> :GFiles --cached --others --exclude-standard<CR>
            noremap <C-o> :GFiles?<CR>
        else
            noremap <C-p> :Files<CR>
        endif

    " Set Vim-specific sequences for RGB colors
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

	"Colorschemes:

        "Default:
            colorscheme amora

    "Background Transparent:
        hi Normal guibg=NONE ctermbg=NONE

