
"-----------------------
"|  Pluging Manager:   |
"-----------------------

    call plug#begin('~/.vim/bundle')

    "Eye Candy
    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'yuttie/comfortable-motion.vim'

    "Navigation Tools
    Plug 'scrooloose/nerdtree'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'kien/ctrlp.vim'
    Plug 'rbgrouleff/bclose.vim'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'wsdjeg/vim-fetch'

    "Writing Tools
    Plug 'yggdroot/indentLine'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'plasticboy/vim-markdown'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'reedes/vim-pencil'
    Plug 'previm/previm'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'vimwiki/vimwiki'

    "Colorschemes
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'sainnhe/vim-color-forest-night'
    Plug 'lifepillar/vim-solarized8'
    Plug 'crusoexia/vim-dracula'
    Plug 'poiuto/gruvbox9'
    Plug 'tyrannicaltoucan/vim-deep-space'
    Plug 'skbolton/embark'

    Plug 'skywind3000/quickmenu.vim'
    Plug 'pseewald/vim-anyfold'
    Plug 'aaronbieber/vim-quicktask'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-vinegar'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'airblade/vim-gitgutter'

    "Dev Tools
    Plug 'christoomey/vim-tmux-runner'
    Plug 'tmsvg/pear-tree'                                                        " Auto pair
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'liuchengxu/vista.vim'
    Plug 'voldikss/vim-floaterm'
    "Plug 'severin-lemaignan/vim-minimap'
    "Plug 'ludovicchabant/vim-gutentags'

    "Python Tools
    Plug 'tpope/vim-fugitive'
    Plug 'vim-scripts/indentpython.vim'
    "Plug 'vim-syntastic/syntastic'
    Plug 'nvie/vim-flake8'
    Plug 'jeetsukumaran/vim-pythonsense'
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'Vimjas/vim-python-pep8-indent'

    "School Tools
    Plug 'sk1418/HowMuch'
    Plug 'sotte/presenting.vim'
    Plug 'vim-scripts/DrawIt'
    Plug 'segeljakt/vim-isotope'

    call plug#end()


"----------------
"|   Plugins    |
"----------------


    " Minimaps:
    "   au BufEnter * :Minimap


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

    " Vista Vim:
        "let g:vista_default_executive = 'ctags'

        "let g:vista_executive_for = {
                    "\ 'py': 'vim_lsp',
                    "\ 'php': 'vim_lsp',
                    "\ }

        "let g:vista#renderer#enable_icon = 1

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

    " Previm:
        "Open Safari to provide preview
        let g:previm_open_cmd = 'open -a Safari'

    " Xpdf:
    "    :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
    "   :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
        "
    " NERDTree:

        "Toggle NERDTree
        nnoremap <silent> <expr> <F6> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

        "Automatically open file for edit
        let NERDTreeQuitOnOpen=1

        "Show hidden files
        let NERDTreeShowHidden=1

        "NERDTree opened automatically
            "autocmd vimenter * silent! lcd %:p:h
            "autocmd vimenter * if !argc() | NERDTree | endif

        "Window size
        let g:NERDTreeWinSize=15

    " Vimisotope:
        "Convert next character into Superscript
        " <C-g><C-k> {char}

        "Convert next character into Subscript
        " <C-g><C-j> {char}

    " Airline:
        let g:airline_theme='minimalist'
        "

    " ComfortablMotionVim:
        "Mapping
           " Default maping <C-d> and <C-u>

    " HowMuch:
        "Precisions of float calculations, default is 2
            let g:HowMuch_scale = 6
        "Define Engine
            let g:HowMuch_auto_engines = ['vim']

    " Quickmenu:
        if !empty(glob('$HOME/.vim/bundle/quickmenu.vim/'))

             "enable cursorline (L) and cmdline help (H)
             let g:quickmenu_options = "LH"

             " clear all the items
             call g:quickmenu#reset()

             "remapping
             noremap <leader>m :call quickmenu#toggle(0)<cr>

             "section 1, text starting with "#" represents a section (see the screen capture below)
             call g:quickmenu#append('# Develop', '')

             call g:quickmenu#append('item 1.1', 'echo "1.1 is selected"', 'select item 1.1')
             call g:quickmenu#append('item 1.2', 'echo "1.2 is selected"', 'select item 1.2')
             call g:quickmenu#append('item 1.3', 'echo "1.3 is selected"', 'select item 1.3')

             "section 2
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
		"Limeline Color name (:help cterm-colors) or ANSI code
		let g:limelight_conceal_ctermfg = 'pink'
		let g:limelight_conceal_ctermfg = 240

		"Goyo & Limeline intergration TODO needed?
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
		"Activated with Goyo, auto detects wrap and hardlines breaks

	" Vim_Anyfold:
		let AnyfoldActivate=1
		set foldlevel=0

	" CtrlP:
		"Invoke CtrlP
            " Key mapping
			 let g:ctrlp_map = '<C-p>'	"aka Command-P
			 let g:ctrlp_cmd = 'CtrlP'
             " Move search window to the top
			 let g:ctrlp_match_window = 'top,order:btt,min:1,max:10,results:10'
             " Ignore all files .git ignores
             let g:ctrlp_user_command = ['.git', '--git-dir=%s/.git ls-files -oc --exclude-standar']


	" Netrw:
        "Default Directory
			"let g:notes_directories = ['~/notes', '~/Dropbox/Shared notes']

		"Default file extentsion
			let g:notes_suffix = '.md'

	" Autopairs:
		"Default settings used.

    " Unimpaired:
	    "Useful mapping for navigating :vimgrep results
		 	"<[q> to <cprevious>
		 	"<q]> to <cnext>

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

    " Vimwiki:
        set nocompatible
        filetype plugin on
        syntax on

        " Disable auto-save notification
        let g:auto_save_silent = 1

        " Save after changes
        let g:auto_save_events = ["InsertLeave", "TextChanged"]

        " Write to All Buffers
        let g:auto_save_wite_all_buffers = 1

        " Path to wikis
        let g:vimwiki_list = [{'path': '$HOME/notes/books', 'syntax': 'markdown', 'ext': '.md'},
                            \{'path': '$HOME/notes/code', 'syntax': 'markdown', 'ext': '.md'},
                            \{'path': '$HOME/notes/warhammer', 'syntax': 'markdown', 'ext': '.md'},
                            \{'path': '$HOME/notes/computer_science', 'syntax': 'markdown', 'ext': '.md'},
                            \{'path': '$HOME/notes/formula_1', 'syntax': 'markdown', 'ext': '.md'},
                            \{'path': '$HOME/notes/mental_health', 'syntax': 'markdown', 'ext': '.md'},
                            \{'path': '$HOME/notes/random', 'syntax': 'markdown', 'ext': '.md'},
                            \{'path': '$HOME/notes/work', 'syntax': 'markdown', 'ext': '.md'},
                            \{'path': '$HOME/notes/mental_health/journal', 'syntax': 'markdown', 'ext': '.md'},
                            \{'path': '$HOME/notes/yelp', 'syntax': 'markdown', 'ext': '.md'}]



        " Consider every markdown file as a wiki file
        let g:vimwiki_global_ext = 0


