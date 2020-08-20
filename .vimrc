" --- Plugins ---
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
"Plug 'hardcoreplayers/spaceline.vim'
Plug 'liuchengxu/eleline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" --- Settings ---
"set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8
set encoding=utf-8
set termencoding=utf-8

set number
set relativenumber
set cursorline
set tw=80

" use mouse
set mouse=a
set selection=exclusive
set selectmode=mouse,key

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

set syntax=on
set wrap " for a line too long
set nobackup
set nowritebackup
setlocal noswapfile
set wildmenu
set ruler
set backspace=2
set noerrorbells
set fillchars=vert:\ ,stl:\ ,stlnc:\ " show space in splited window

set showmatch " highlight matched parentheses
set matchtime=5

set laststatus=2
set hidden
set cmdheight=2

if !&scrolloff
    set scrolloff=3
endif
if !&sidescrolloff
    set sidescrolloff=5
endif    

" --- Key Bindings ---
" indent
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

inoremap jk <Esc>
nnoremap sr :%s//g<Left><Left>

augroup vimplug_maps
    au!
    au FileType vim nmap pi :PlugInstall<CR>
    au FileType vim nmap pg :PlugUpgrade<CR>
    au FileType vim nmap pd :PlugUpdate<CR>
    au FileType vim nmap pc :PlugClean<CR>
    au FileType vim nmap pr :so %<CR>
augroup END

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

" spaceline.vim
let g:spaceline_colorscheme = 'space'

" coc settings
if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvm')
    inoremap <silent><expr> <C-space> coc#refresh()
else
    inoremap <silent><expr> <C-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd CursorHold * silent call CocActionAsync('highlight')


