" airline/ALE: enable vim-airline integration with ALE
 let g:airline#extensions#ale#enabled = 1
" end airline/ALE

" display stuff
set number

" enable scrolling, text grabbing etc
set mouse=a

 filetype plugin on
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

" play nice with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" save automatically
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI", "CompleteDone"]

set updatetime=100

" gitgutter settings
set signcolumn=yes

" make committia edit window wider than line wrap
let g:committia_edit_window_width = 88
let g:committia_status_window_min_height = winheight(0)/4
let g:committia_status_window_max_height = winheight(0)/2
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Scroll the diff window in insert and command modes with <C-d> and <C-u>
    noremap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
    noremap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)
    inoremap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
    inoremap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)
endfunction
" end committia
