" turn relative line numbers on
set relativenumber
set number
set rnu

" Add cursor line and column
set cursorline
set cursorcolumn
set colorcolumn=80,120
highlight ColorColumn ctermbg=0 guibg=lightgrey

" vsplit
" USE ':vs' and ':sp'
"nmap <silent> <leader>sv :vsplit<cr>
"nmap <silent> <leader>sh :split<cr>

" Tab behavior for different file formats
autocmd FileType robot          setlocal shiftwidth=8 softtabstop=8 tabstop=8 noexpandtab
autocmd FileType c,cpp          setlocal shiftwidth=8 softtabstop=8 tabstop=8 noexpandtab
autocmd FileType python         setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType html           setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript     setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType css            setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType yaml           setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType markdown       setlocal shiftwidth=2 softtabstop=2 noexpandtab

" quickfix window full width
:autocmd FileType qf wincmd J

" Support listchars
set listchars=eol:¬,trail:·,tab:▸·
nmap <leader>lc :set invlist<cr>

" Highlight trailing whitespaces and spaces before tabs
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t/

" Paragraph width using 'par' command
set formatprg=par\ -w80
