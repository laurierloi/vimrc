" turn relative line numbers on
set relativenumber
set number
set rnu

" Add cursor line and column
set cursorline
set cursorcolumn

" Mapping for easyalign
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

"" Plugs
"call plug#begin()
"
"Plug 'junegunn/vim-easy-align'
"
"Plug 'maralla/completor.vim'
"Plug 'Shougo/neoinclude.vim'
"
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1
"
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
"
"" Language specific
""
"" Robot Tests
"Plug 'mfukar/robotframework-vim'
"
"call plug#end()
"
"" Python
"" Need to install jedi
"" pip3 install jedi
"let g:completor_python_binary = '/usr/bin/python3'
