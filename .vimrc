
" airline/ALE: enable vim-airline integration with ALE
let g:airline#extensions#ale#enabled = 1
" end airline/ALE

" display stuff
set number

" enable scrolling, text grabbing etc
set mouse=a

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" end display stuff

" solarized
syntax enable
set termguicolors
set background=dark
colorscheme solarized8
" end solarized

" fzf
set rtp+=~/.fzf
" end fzf

" clipboard finagling to default to OSX system clipboard
set clipboard=unnamed
" end clipboard finagling

" ALE: stuff to run at the end
" Load all plugins now -- before helptags can be generated
packloadall

" Load all of the helptags now, ignoring errors
silent! helptags ALL
" end ALE
