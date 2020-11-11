" turn relative line numbers on
set relativenumber
set number
set rnu

" Add cursor line and column
set cursorline
set cursorcolumn

" vsplit
" USE ':vs' and ':sp'
"nmap <silent> <leader>sv :vsplit<cr>
"nmap <silent> <leader>sh :split<cr>

" Tab behavior for different file formats
autocmd FileType robot    setlocal shiftwidth=4 softtabstop=4 noexpandtab
autocmd FileType c,cpp    setlocal shiftwidth=4 softtabstop=4 noexpandtab
autocmd FileType python   setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType html     setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType markdown setlocal shiftwidth=2 softtabstop=2 noexpandtab

" quickfix window full width
:autocmd FileType qf wincmd J
