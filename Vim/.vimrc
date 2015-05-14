syntax on
set tabstop=2
set expandtab
set shiftwidth=2
set shiftround

syntax enable
colorscheme monokai
set number

au BufRead,BufNewFile *.py set filetype=python
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType arduino colorscheme arduino

