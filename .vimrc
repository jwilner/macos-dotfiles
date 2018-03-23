
" enable vim-airline integration with ALE
let g:airline#extensions#ale#enabled = 1

syntax enable
set background=dark
colorscheme solarized

" stuff to run at the end

"" Load all plugins now -- before helptags can be generated
packloadall

" Load all of the helptags now, ignoring errors
silent! helptags ALL
