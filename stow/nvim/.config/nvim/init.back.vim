"        __  __                      _
"       / / / /_  ________________ _(_)___
"      / /_/ / / / / ___/ ___/ __ `/ / __ \
"     / __  / /_/ (__  |__  ) /_/ / / / / /
"    /_/ /_/\__,_/____/____/\__,_/_/_/ /_/
"
""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
" >-> General Options
""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable line numbers
set number

" Scroll when close to the top/bottom
set scrolloff=8

" Tab options
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set smartindent


""""""""""""""""""""""""""""""""""""""""""""""""""
" >-> Plugins (vim-plug)
""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(stdpath('data') . '/plugged')

" Material theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Hybrid number toggle
Plug 'jeffkreeftmeijer/vim-numbertoggle', { 'branch': 'main' }

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""
" >-> Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""
" Truecolors
if (has('termguicolors'))
    set termguicolors
endif

" Colorscheme
let g:tokyonight_style = 'night'
colorscheme tokyonight

" Font
set guifont="FiraCode Nerd Font"


""""""""""""""""""""""""""""""""""""""""""""""""""
" >-> Remaps
""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

" Reload init.vim
nnoremap <LEADER>r<CR> :source $MYVIMRC<CR>

" Curl-j/k inserts line below/above, and Alt-j/k deletes.
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <silent><A-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>

" Past without copying
vnoremap p "_dP

" Yand to clipboard
nnoremap <LEADER>y "+y
vnoremap <LEADER>y "+y

" Move line
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

" Next and Previuos buffers
nnoremap <LEADER>bn :bnext<CR>
nnoremap <LEADER>bp :bprev<CR>

" window settings
nnoremap <LEADER>w <C-w>

