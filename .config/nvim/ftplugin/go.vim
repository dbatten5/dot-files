"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_def_mapping_enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC KEY MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <c-k> .

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM-GO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <space>ob :GoBuild<cr>
nnoremap <space>or :GoRun<cr>
nnoremap <space>oin :GoInstall<cr>
nnoremap <space>ott :GoTest<cr>
nnoremap <space>otf :GoTestFunc<cr>
nnoremap <space>oim :GoImport
nnoremap <space>ode :GoDef<cr>
