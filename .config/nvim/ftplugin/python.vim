"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC KEY MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert hash rocket
inoremap <c-l> :<space>
" Insert array selectors
inoremap <c-j> ['
inoremap <c-h> ']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PYMODE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_lint_on_fly = 0
let g:pymode_lint_on_write = 1
let g:pymode_lint_ignore = ["E501"]
