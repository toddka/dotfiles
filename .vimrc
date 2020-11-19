:inoremap jj <esc>

set relativenumber number

" Default copy/paste to system keyboard
set clipboard=unnamedplus

" Turn on syntax highlighting
syntax on

" Enable mouse - stops line numbers on copy
:set mouse=a

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Set line color

:highlight LineNr ctermfg=grey

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

