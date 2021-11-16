" --- Plugins ---
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'liuchengxu/eleline.vim'
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


let mapleader="\<Space>"
let maplocalleader=","
nmap <leader>w :w<CR>
nmap <leader>p \"+p
nmap <leader>y \"+y
nmap <leader>q :q<CR>
" navigate buffers
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B ":blast<CR>
nnoremap <leader>1 :1b<CR>
nnoremap <leader>2 :2b<CR>
nnoremap <leader>3 :3b<CR>

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
" ----- vim-plug -----
augroup vimplug_maps
    au!
    au FileType vim nmap pi :PlugInstall<CR>
    au FileType vim nmap pg :PlugUpgrade<CR>
    au FileType vim nmap pd :PlugUpdate<CR>
    au FileType vim nmap pc :PlugClean<CR>
    au FileType vim nmap pr :so %<CR>
augroup END

" ----- vim-easy-align -----
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign>
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" ----- coc.nvim -----
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')