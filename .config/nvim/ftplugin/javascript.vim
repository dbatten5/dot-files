"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC KEY MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert an arrow
inoremap <c-k> .
" Insert hash rocket
inoremap <c-l> <space>=><space>
" Insert array selectors
inoremap <c-j> ['
inoremap <c-h> ']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let b:ale_linters = ['flow', 'eslint']
let b:ale_fixers = ['eslint']
