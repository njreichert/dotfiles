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

set backspace=indent,eol,start

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

set updatetime=100

set hlsearch
set noerrorbells

set signcolumn=number
set number

highlight clear SignColumn
highlight DiffAdd ctermfg=LightBlue ctermbg=NONE term=bold
highlight DiffChange ctermfg=LightMagenta ctermbg=NONE term=bold
highlight DiffDelete ctermfg=LightRed ctermbg=NONE term=bold

" Use vim terminal, but split vertically.
map <C-x> :vert rightb terminal<CR>

function! CheckBackspace() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ CheckBackspace() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

if exists('*complete_info')
  inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <C-g> <Plug>(coc-definition)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

