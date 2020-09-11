autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal commentstring=#\ %s
"
"" set tab and shift width to 4 spaces
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

" Insert hash rocket
inoremap <c-l> <space>=><space>
" Insert array selectors
inoremap <c-j> ['
inoremap <c-h> ']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let b:ale_linters = ['rubocop']
let b:ale_fixers = ['rubocop']
