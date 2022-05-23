set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin()

Plug 'neoclide/coc.nvim'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

" All of your Plugs must be added before the following line
call plug#end()
filetype plugin indent on    " required

set t_Co=16
highlight Pmenu ctermfg=7 ctermbg=8 guifg=#ffffff guibg=#808080

set completeopt-=preview

" Airline configs
let g:airline_powerline_fonts = 1
let g:airline_theme='term'

" Personal config
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set showcmd
set showmatch

set hlsearch
set noerrorbells
set number
set timeoutlen=10

set conceallevel=2

" Use vim terminal, but split vertically.
map <C-x> :vert rightb terminal<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

if exists('*complete_info')
  inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif

