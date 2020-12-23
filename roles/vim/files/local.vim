
" Extra things
if dein#tap('vim-startify') "{{{
	let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
	let g:startify_files_number = 8
	let g:startify_change_to_dir = 0
	let g:startify_change_to_vcs_root = 1
	let g:startify_skiplist = [
	\ '.git/COMMIT_EDITMSG',
	\ '/etc/*',
	\ $VIMRUNTIME . '*/doc',
	\ 'bundle/.*/doc'
	\ ]

	"let g:startify_list_order = [
	"      \ ['   MRU:'],
	"      \ 'files',
	"      \ ['   Sess:'],
	"      \ 'sessions',
	"      \ ['   Markers:'],
	"      \ 'bookmarks'
	"      \ ]
	" Startify Custom Header
	let g:startify_custom_header = [
	\ '  .____---^^     ^^---____.                                                      ',
	\ '  TI      *       *      IT  Three Rings for the Elvin-Kings under the sky.      ',
	\ '  !I          *          I!  Seven for the DwarfLords in their halls of stone.   ',
	\ '   X                     X   Nine for the Mortal Men doomed to die.              ',
	\ '   XL                   JX   One for the Dark Lord on his dark throne.					  ',
	\ '   II        / \        II   In the Land of Mordor where the Shadow Lies.        ',
	\ '   II   / \ /   \ / \   II                                                       ',
	\ '    X  /   v     v   \  X    One Ring to rule them all,												  ',
	\ '    ''''/    _     _    \''''    One Ring to find them.												  ',
	\ '     \\- _-_ -_- _-_ -//     One Ring to bring them all...                       ',
	\ '       \\_-  -_-  -_//       And in the Darkness Bind Them!											',
	\ '         ''''       ''''         In the Land of Mordor where the Shadows Lie.    ',
	\ '           ''''-_-''''                                                           ',
	\ '                                                    "Lord Of The Rings"          ',
	\ '                                                     by J.R.R. Tolkien						',
	\ '',
	\ ]
endif
"}}}

"
"
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=menuone,noselect,noinsert
" set shortmess+=c
" inoremap <c-c> <ESC>
" " make it fast
" let ncm2#popup_delay = 5
" let ncm2#complete_length = [[1, 1]]
" " Use new fuzzy based matches
" let g:ncm2#matcher = 'substrfuzzy'
"
" " Disable Jedi-vim autocompletion and enable call-signatures options
" let g:jedi#auto_initialization = 1
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#popup_on_dot = 0
" let g:jedi#completions_command = ""
" let g:jedi#show_call_signatures = "1"
" "
" let s:coc_extensions = [
"      \  'coc-css',
"      \  'coc-emmet',
"      \  'coc-highlight',
"      \  'coc-html',
"      \  'coc-dictionary',
"      \  'coc-emoji',
"      \  'coc-omni',
"      \  'coc-tag',
"      \  'coc-pairs',
"      \  'coc-java',
"      \  'coc-json',
"      \  'coc-pyls',
"      \  'coc-rls',
"      \  'coc-snippets',
"      \  'coc-solargraph',
"      \  'coc-yaml',
"      \  'coc-eslint',
"      \  'coc-jest',
"      \  'coc-prettier',
"      \  'coc-tslint',
"      \  'coc-tsserver',
"      \ ]
"
"
" call coc#add_extension(join(get(s:, 'coc_extensions', [])))
"
" " if hidden not set, TextEdit might fail.
" set hidden
"
" " Better display for messages
" set cmdheight=2
"
" " Smaller updatetime for CursorHold & CursorHoldI
" set updatetime=300
"
" " don't give |ins-completion-menu| messages.
" set shortmess+=c
"
" " always show signcolumns
" set signcolumn=yes
"
" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
" " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Use <c-space> for trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
"
" " Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
" " Use `[c` and `]c` for navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)
"
" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" " Use K for show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if &filetype == 'vim'
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
"
" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
"
" " Remap for format selected region
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
"
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
"
" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" vmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
"
" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)
"
" " Use `:Format` for format current buffer
" command! -nargs=0 Format :call CocAction('format')
"
" " Use `:Fold` for fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"
" " Add diagnostic info for https://github.com/itchyny/lightline.vim
" let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component_function': {
"      \   'cocstatus': 'coc#status'
"      \ },
"      \ }
"
"
"
" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
