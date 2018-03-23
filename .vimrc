
" airline/ALE: enable vim-airline integration with ALE
let g:airline#extensions#ale#enabled = 1
" end airline/ALE

" solarized
syntax enable
set background=dark
colorscheme solarized
" end solarized

" fzf
set rtp+=~/.fzf
" end fzf

" notational-fzf-vim: define search paths 
let g:nv_search_paths = ['~/notes']
" end notational-fzf-vim

" clipboard finagling to default to OSX system clipboard
set clipboard=unnamed
" end clipboard finagling

" ALE: stuff to run at the end
" Load all plugins now -- before helptags can be generated
packloadall

" Load all of the helptags now, ignoring errors
silent! helptags ALL
" end ALE
