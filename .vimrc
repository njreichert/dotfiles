set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ycm-core/YouCompleteMe'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" ycm config
"

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_show_diagnostics_ui = 0

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
