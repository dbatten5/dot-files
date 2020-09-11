"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC KEY MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert an arrow
inoremap <c-k> ->
" Insert hash rocket
inoremap <c-l> <space>=><space>
" Insert array selectors
inoremap <c-j> ['
inoremap <c-h> ']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ABBREVIATIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabbrev art !php artisan
cnoreabbrev mm !php artisan make:model
cnoreabbrev mc !php artisan make:controller
cnoreabbrev mt !php artisan make:test
cnoreabbrev mh !php artisan make:helper
cnoreabbrev mmig !php artisan make:migration
cnoreabbrev mig !php artisan migrate && php artisan migrate --database mysql_testing
cnoreabbrev migl !php artisan migrate
cnoreabbrev migt !php artisan migrate --database mysql_testing
cnoreabbrev ps !php artisan populate:search
cnoreabbrev tdb --database mysql_testing

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LARAVEL COMMONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>va :e routes/api.php<cr>
nnoremap <leader>ma :e vendor/mettrr/core-app<cr>
nnoremap <leader>md :e vendor/mettrr/core-database<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP NAMESPACE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alphabetisize the use statements
let g:php_namespace_sort_after_insert = 1

" Insert the use statement
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <leader>u :call PhpInsertUse()<CR><Paste>

" Expand a class name to the qualified name
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <leader>ex <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <leader>ex :call PhpExpandClass()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP REFACTORING TOOLBOX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_php_refactoring_default_property_visibility = 'private'
let g:vim_php_refactoring_default_method_visibility = 'private'
let g:vim_php_refactoring_auto_validate_visibility = 1
let g:vim_php_refactoring_use_default_mapping = 0
nnoremap <leader>rlv :call PhpRenameLocalVariable()<cr>
nnoremap <leader>rcv :call PhpRenameClassVariable()<cr>
nnoremap <leader>rrm :call PhpRenameMethod()<cr>
vnoremap <leader>rec :call PhpExtractConst()<cr>
nnoremap <leader>rep :call PhpExtractClassProperty()<cr>
vnoremap <leader>rem :call PhpExtractMethod()<cr>
vnoremap <leader>reu :call PhpExtractUseStatement()<cr>
nnoremap <leader>rdu :call PhpDetectUnusedUseStatements()<cr>
vnoremap <leader>r== :call PhpAlignAssigns()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PDV
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pdv_template_dir = $HOME ."/.config/nvim/plugged/pdv/templates_snip"
inoremap <c-d> <esc>:call pdv#DocumentWithSnip()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP CS FIXER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If you use php-cs-fixer version 2.x
let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let b:ale_fixers = ['php_cs_fixer']
