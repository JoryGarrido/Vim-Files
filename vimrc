"Plugins
call plug#begin('~/.vim/plugged')
" Vim colorscheme
Plug 'owickstrom/vim-colors-paramount'
call plug#end()

" Colors 
syntax enable " Turns on syntax hilighting
color

" UI Config
set number relativenumber " Turn on both line numbers and relative numbers. This enables 'hybrid numbers'
set showcmd " Show command in bottom bar
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set lazyredraw " Redraw only when we need to


" Spaces & Tabs
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs become hotkey for 4 spaces


" Searching
set incsearch " search as characters are entered
set hlsearch " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Leader Shortcuts
let mapleader="," " leader is comma
inoremap jk <esc>

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.ts,*.css,*.scss
        \:call <SID>StripTrailingWhiteSpaces()
    autocmd VimEnter * colorscheme paramount
augroup END

" Functions
" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

