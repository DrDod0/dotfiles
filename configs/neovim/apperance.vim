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
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum""

	"Colorschemes:

        "Default:
            colorscheme gruvbox9
            let g:gruvbox_filetype_hi_groups = 1
            let g:gruvbox_italic = 1
            let g:gruvbox_plugin_hi_groups = 1

        "VimDeepSpace:
            fun! s:Deep()
                set background=dark
                set termguicolors
                colorscheme deep-space
                syntax on
                let g:deepspace_italics=1
                let g:airline_theme='deep_space'
            endfunction
            command Deep cal s:Deep()

        "Dracula:
           	fun! s:Dra()
                colorscheme dracula
                set background=dark
                syntax on
            endfunction
            command Dra call s:Dra()

		"Palenight:
		    fun! s:Pale()
                set background=dark
                colorscheme palenight
            endfun
            command Pale call s:Pale()

		"Solarize:
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

    "Background Transparent:
        hi Normal guibg=NONE ctermbg=NONE

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
		"set statusline +=%1*%4v\ %*	         "virtual column number
		"set statusline +=%{strftime('%-I:%M')}	"time in 12h format

	"Syntax:
        " File type *markdown
		    "autocmd! bufreadpost *.markdown set syntax=off

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


" Terminal Alacritty mouse issue fix
" set ttymouse-sgr
