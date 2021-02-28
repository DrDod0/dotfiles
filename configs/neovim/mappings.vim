
"------------------------------------------
"|   Remapping / Mapping / Abbreviation:  |
"------------------------------------------

    " Automatically reload .vimrc file on save
        augroup myvimrc
            au!
            au BufWritePost .vimrc so ~/.vimrc
        augroup END


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

    "Vim Tmux Runner
        let g:VtrStripLeadingWhitespace = 0
        let g:VtrClearEmptyLines = 0
        let g:VtrAppendNewline = 1

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


    "Easy CAPS
        "inoremap <c-u> <ESC>viwUi
        "nnoremap <c-u> viwU<ESC>

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

    "Helper file:
        "nnoremap <C-t> :vs ~/notes/Index_Helper.markdown<CR>:vertical resize 35<CR>

    "Work Soap Notes
        "nnoremap <C-s> :tabnew <esc>i#About<CR><CR>#Bodywork<CR><CR>#Other<CR>+ <C-R>=strftime("%m.%d.%y")<CR> - 60m - ##<esc>:w ~/notes/Work/Clients.Massage.Envy/.md<left><left><left>

    "Insert current date with 'zdt'
        iab zdt <c-r>=strftime("%m.%d.%y")<CR>

    "Vimgrep Shortcut w/ :lopen automated
        augroup myvimrc
            autocmd!
            autocmd QuickFixCmdPost [^l]* cwindow
            autocmd QuickFixCmdPost l*    lwindow
        augroup END

    "Search all file for a string
        nnoremap <leader>f :lvimgrep! // ** <left><left><left><left><left>

    "Vim Help in full screen
        nnoremap <C-h> :help  <bar> only <left><left><left><left><left><left><left><left>

    "Rot-13 the screen
        map <leader>r mzHVLg?`z

    "Spelling error I'm feeling lucky
        function! FixSpellingError()
            normal! mm[s1z=`m
        endfunction
        nnoremap <leader>sp :call FixSpellingError()<cr>

    "Leader-h redraws screen & removes highlight
        nnoremap <leader>h :nohl<CR>

    "Remove Trailing whitespace on save
        autocmd BufWrite * :%s/\s\+$//e


    "School Remapping

        " Calculator
            ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
        " arrow
            iab aup [↑]
            iab adown [↓]
            iab ^^ [⇅]



