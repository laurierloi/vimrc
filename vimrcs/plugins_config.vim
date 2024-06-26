"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requires that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/.."
call pathogen#infect(s:vim_runtime.'/sources_forked/{}')
call pathogen#infect(s:vim_runtime.'/sources_non_forked/{}')
call pathogen#infect(s:vim_runtime.'/my_plugins/{}')
call pathogen#helptags()


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
"map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
" TODO: learn how to use
let g:yankstack_yank_keys = ['y', 'd']

nmap <C-m> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste

""""""""""""""""""""""""""""""
" => Fly Mode
""""""""""""""""""""""""""""""
let g:AutoPairsFlyMode = 0

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" TODO: unused for now, see how it works
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-visual-multi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers']  ],
      \   'right': [ ['close']  ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

let g:lightline#bufferline#show_number=1
let g:lightline#bufferline#clickable=1
let g:lightline.component_raw = {'buffers': 1}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"
" For python: pip install python-lsp-server
" For rust, see: https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['pylsp'],
\   'go': ['go', 'golint', 'errcheck'],
\   'robot': ['robocop'],
\   'rust': ['analyzer'],
\   'c': [],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\   'python': ['autopep8'],
\}
" extra fixers
"\   'python': ['isort', 'autopep8'],

" Disabling highlighting
let g:ale_set_highlights = 1

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 1

let g:ale_completion_enabled = 1

let g:ale_python_auto_virtualenv = 1

" Show errors in the preview window, but exit on inert
let g:ale_cursor_detail = 1
let g:ale_close_preview_on_insert = 1

let g:ale_rust_analyzer_executable='/home/lal/.local/bin/rust-analyzer'

" define shortkeys
nmap <silent> <leader>lr :ALEFindReferences<cr>
nmap <silent> <leader>lg :ALEGoToDefinition<cr>
nmap <silent> <leader>li :ALEGoToImplementation<cr>
nmap <silent> <leader>ld :ALEDetail<cr>
nmap <silent> <leader>ln :ALENextWrap<cr>
nmap <silent> <leader>lp :ALEPreviousWrap<cr>
nmap <silent> <leader>lk :ALENext<cr>
nmap <silent> <leader>lj :ALEPrevious<cr>
nmap <silent> <leader>ls :ALESymbolSearch<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Copilot
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <silent><script><expr> <C-i> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

let g:copilot_filetypes = {
\ 'rust': v:false,
\ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete (autocompletion)
"    TODO: check if we can switch to https://github.com/Shougo/ddc.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTE: we disabled deoplete because it was causing issues with
"       the python virtualenv... for now we simply use ale
"
""let g:deoplete#enable_at_startup = 1
"let g:neocomplete#enable_smart_case = 1
"call deoplete#custom#option('sources', {
"\ '_': ['ale'],
"\})

"call deoplete#custom#option({
"\ 'auto_complete_delay': 0.1,
"\ 'auto_complete_start_length': 1,
"\ 'enable_at_startup': 1,
"\ 'enable_smart_case': 1,
"\ 'force_omni_input_patterns': {},
"\ })


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
nnoremap <silent> <leader>d :GitGutterToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Easy Align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_level = 3
set conceallevel=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = "/home/lal/.vim_runtime/my_plugins/YouCompleteMe/.ycm_extra_conf.py"
let g:ycm_enable_diagnostic_signs = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:javascript_conceal_function             = "ƒ"
"let g:javascript_conceal_null                 = "ø"
"let g:javascript_conceal_this                 = "@"
"let g:javascript_conceal_return               = "⇚"
"let g:javascript_conceal_undefined            = "¿"
"let g:javascript_conceal_NaN                  = "ℕ"
"let g:javascript_conceal_prototype            = "¶"
"let g:javascript_conceal_static               = "•"
"let g:javascript_conceal_super                = "Ω"
"let g:javascript_conceal_arrow_function       = "⇒"
"let g:javascript_conceal_noarg_arrow_function = "🞅"
"let g:javascript_conceal_underscore_arrow_function = "🞅"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-prettier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#config#print_width = 80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>tt :TagbarToggle<cr>
nmap <leader>ts :TagbarShowTag<cr>
nmap <leader>tp :TagbarTogglePause<cr>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_width = 30
let g:tagbar_show_linenumbers = 1
let g:tagbar_show_numbers = 1
let g:tagbar_show_fold_buttons = 1
let g:tagbar_show_scopes = 1
let g:tagbar_show_accessibility = 1
let g:tagbar_show_visibility = 1
let g:tagbar_show_inheritance = 1
let g:tagbar_show_structs = 1
let g:tagbar_show_enums = 1
let g:tagbar_show_interfaces = 1
let g:tagbar_show_constants = 1
let g:tagbar_show_variables = 1
let g:tagbar_show_methods = 1
let g:tagbar_show_functions = 1
let g:tagbar_show_constructors = 1
let g:tagbar_show_operators = 1
let g:tagbar_show_type = 1
let g:tagbar_show_fields = 1
let g:tagbar_show_macros = 1
let g:tagbar_show_preprocessor = 1
let g:tagbar_show_attributes = 1
let g:tagbar_show_events = 1
let g:tagbar_show_imports = 1
let g:tagbar_show_exports = 1
let g:tagbar_show_classes = 1
let g:tagbar_show_namespaces = 1
let g:tagbar_show_modules = 1
