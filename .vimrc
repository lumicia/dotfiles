" --- Plugins ---
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'

call plug#end()

" --- Settings ---
set fileencodings=uft-8,ucs-bom,gb18030,gbk,gb2312,cp936
set encoding=utf-8
set termencoding=utf-8

set number
set cursorline

set mouse=a " use mouse
set selection=exclusive
set selectmode=mouse,key

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set syntax=on
set nowrap
set nobackup
setlocal noswapfile
set wildmenu
set ruler
set backspace=2
set noerrorbells
set fillchars=vert:\ ,stl:\ ,stlnc:\ " show space in splited window

set showmatch " highlight matched parentheses
set matchtime=5

set laststatus=2

" indent
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

imap jk <Esc>

let mapleader="\<Space>"
let maplocalleader=","
nmap <leader>w :w<CR>
nmap <leader>p \"+p
nmap <leader>y \"+y
nmap <leader>q :q<CR>

" cursor mode settings
" 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI.="\e[5 q" "SI=INSERT mode
let &t_SR.="\e[4 q" "SR=REPLACE mode
let &t_EI.="\e[1 q" "EI=NORMAL mode (ELSE)

" --- Plugin Settings ---
" easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign>
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
