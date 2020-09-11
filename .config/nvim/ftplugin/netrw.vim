"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable the s key in netrw as it messes up the structure
autocmd FileType netrw noremap <buffer> s <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_browse_split = 2
" let g:netrw_preview = 1
" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC KEY MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <c-t> :Lexplore<cr>
noremap <c-e> :Explore<cr>
noremap <buffer> <c-l> <c-w>l
