" --- Plugins ---
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'liuchengxu/eleline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Chiel92/vim-autoformat'
Plug 'Yggdroot/indentLine'
Plug 'github/copilot.vim'
Plug 'neovim/nvim-lspconfig'

" Python
Plug 'tell-k/vim-autopep8'
Plug 'psf/black'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'mhinz/vim-crates'
Plug 'simrat39/rust-tools.nvim'

" C++
Plug 'jackguo380/vim-lsp-cxx-highlight'
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
" insert ; in the end of the line
inoremap xx <ESC>$a; 
" move to the head of the line
nmap H ^ 
" move to the end of the line
nmap L $ 

" Make <TAB> used for trigger completion, completion confirm, snippet expand and jump like VS Code.
"inoremap <silent><expr> <TAB>
"    \ pumvisible() ? coc#_select_confirm() :
"    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippet-expand-jump',''])\<CR>" :
"    \ <SID>check_back_space() ? "\<TAB>" :
"    \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

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
" globally replace
nnoremap <leader>s :%s//g<Left><Left>  
" delete to head of the line
nmap <leader>h d^a 
" delete to tail of the line
nmap <leader>l d$a 
" navigate buffers
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

" brace indent
imap {<CR> {<CR>}<ESC>O
"imap }<CR> <CR>}<ESC>O
imap ] []<ESC>i<CR><ESC>O
"imap (<CR> (<CR>)<ESC>O
imap ) ()<ESC>i<CR><ESC>O

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" vim-crate settings
if has('nvim')
    autocmd BufRead Cargo.toml call crates#toggle()
endif

" vim-autoformat settings
let g:python3_host_prog = '/usr/bin/python3.9'
let g:formatpath = ['/usr/bin/clang-format-10']
let g:formatdef_my_clang = '"clang-format"'
let g:formatters_cpp = ['my_clang']
let g:formatters_c = ['my_clang']
let g:fomatters_python = ['black']
noremap <F9> :Autoformat<CR>

" coc-explorer settings
nmap <leader>x <Cmd>CocCommand explorer<CR>

" indentLine
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" vim-crates
highlight Crates ctermfg=green ctermbg=NONE cterm=NONE
