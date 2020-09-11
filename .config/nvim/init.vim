" remove all exisiting autocmds
autocmd!

call plug#begin()
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}
Plug 'chaoren/vim-wordmotion'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries'}
Plug 'idanarye/vim-merginal'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'ludovicchabant/vim-gutentags'
Plug 'maxmellon/vim-jsx-pretty', {'for': 'javascipt'}
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript', {'for': 'javascipt'}
Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }
Plug 'radenling/vim-dispatch-neovim'
Plug 'SirVer/ultisnips'
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
Plug 'terryma/vim-multiple-cursors'
Plug 'tobyS/vmustache' | Plug 'tobyS/pdv', {'for': 'php'}
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Custom plugins
Plug g:plug_home.'/pxtorem'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOUR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme base16-ocean
let base16colorspace=256

if has("termguicolors")
    set termguicolors
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable plugins and indents by filetype
filetype plugin indent on

" Change leader to comma
let g:mapleader = ","

" Highlight the current line
set cursorline
" Show line numbers
set number
" Show line numbers relative to the current line
set relativenumber
" Store lots of command line history
set history=100
" Smart case search if there is a uppercase
set ignorecase smartcase
" Highlight the matching the matching bracket
set showmatch
" Jump to the first non-blank character of the line
set nostartofline
" Enable word wrap
set wrap
" Wrap lines at convenient points
set linebreak
" Display extra whitespace
set list listchars=tab:\ \ ,trail:·,nbsp:·
" Do not redraw on registers and macros
set lazyredraw
" Hide buffers in the background
set hidden
" Set new vertical splits to the right
set splitright
" Set new horizontal splits to the below
set splitbelow
" Allow recursive search
set path+=**
" Wrap text at 80 characters
set textwidth=80
" Turn off that bell noise
set visualbell noerrorbells
" Incremental searching
set incsearch
set nohlsearch

" Turn on syntax highlighting
syntax on

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Persistent undo
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" Indentation
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set autoindent
set colorcolumn=80

" Folding
" set nofoldenable

" Start scrolling when 8 lines away from margins
set scrolloff=4
set sidescrolloff=15
set sidescroll=5

" Set the tags location
" set tags+=tags,tags.vendor

" Make sure git diff opens a vertical buffer
set diffopt=vertical

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC KEY MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly open and source my vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Quote mark mappings
nnoremap <leader>q" ciw""<esc>P
nnoremap <leader>q' ciw''<esc>P
" Center the screen on next match
nnoremap n nzz
" Make <c-c> the same as esc in insert mode
inoremap <c-c> <esc>
" Quicker window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Quicker saves
nnoremap s :w!<cr>
" Center the screen while in insert mode
inoremap <c-z> <esc>zz$a
" Remap the hash key as it's awkward on a mac
nnoremap & #
" Motion for entire function definition
vnoremap af i{2jok
" Swap ' and ` for going to marks
nnoremap ' `
nnoremap ` '
" Quick resizing
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<cr>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<cr>
nnoremap <right> :vertical resize +5<cr>
nnoremap <left> :vertical resize -5<cr>
" Exchange J and j in visual mode because I keep pressing it in my haste when I
" go into visual block / line mode and want to immediately move down a line
vnoremap J j
" Do the same for K and k
vnoremap K k
" Remove K in normal mode too cos it's annoying and I never use it
nnoremap K <nop>
" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<cr>
" Swap 0 and ^ as ^ is more useful but more keystrokes to get to
nnoremap 0 ^
nnoremap ^ 0
" copy to system clipboard
vnoremap <c-c> "+y
" Paste from system clipboard
inoremap <c-v> <esc>"+p
" Indent without killing the selection in vmode
vnoremap < <gv
vnoremap > >gv
" Delete every buffer except the one open
command! BQ :silent call general#CloseAllBuffersApartFromThisOne()
" Open a ctag definition in a new split by default
" nnoremap <c-]> :vsp <cr>:exec("tag ".expand("<cword>"))<cr>
" Allow the option to open ctag def in current window
" nnoremap <c-\> <c-]>
" open devdocs.io with chrome and search the word under the cursor (Phantas0s)
command! -nargs=? DevDocs :call system('type -p open >/dev/null 2>&1 && open https://devdocs.io/#q=<args> || chrome -url https://devdocs.io/#q=<args>')
nnoremap <silent> <leader>D :exec "DevDocs " . fnameescape(expand('<cword>'))<cr>
" Execute a macro for the all selection
xnoremap @ :<c-u>call general#ExecuteMacroOverVisualRange()<cr>
" Swap v and ctrl-v as visual block mode is more useful
nnoremap v <c-v>
nnoremap <c-v> v
vnoremap v <c-v>
vnoremap <c-v> v
" Quickly set the local working directory
nnoremap <leader>ld :lcd %:p:h<cr>
" Set foldmethod indent
nnoremap <leader>fm :set foldmethod=indent<cr>
" Remove folds
nnoremap <leader>fn :set nofoldenable<cr>
" Remove whitespace
nnoremap <leader>ws :call general#StripTrailingWhiteSpaces()<cr>
" Insert filename
inoremap <leader>fn <c-r>=expand("%:t:r")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrc
    autocmd!
augroup END

" Auto-remove trailing whitespace
" autocmd vimrc BufWritePre * :call general#StripTrailingWhiteSpaces()
" Remove cursorline highlight
autocmd vimrc InsertEnter,BufLeave * :set nocul
" Add cursorline highlight
autocmd vimrc InsertLeave,BufEnter * :set cul
" Refresh file when vim gets focus
autocmd vimrc FocusGained,BufEnter * checktime
" Jenkinsfile syntax highlighting
au BufNewFile,BufRead Jenkinsfile setf groovy
" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd vimrc BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

augroup templates
    autocmd BufNewFile *.go 0r ~/.config/nvim/templates/skeleton.go
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMPLETION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Things to ignore when searching
set wildmode=list:full
set wildignore=*.git*
set wildignore+=*/vendor/**
set wildignore+=*/node_modules/**
set wildignore+=*/public/**
set wildignore+=*/venv/**
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUSLINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi User1 guifg=#FF0000 guibg=#2C323C
" Mode
set statusline=\ %{toupper(mode())}
" Git branch
set statusline+=\ %{fugitive#head()}
" File path
set statusline+=\ %4F
" Modified indicator
set statusline+=\ %1*%m%*
" Preview indicator
set statusline+=\ %w
" Quickfix list indicator
set statusline+=\ %q
" Start right side layout
set statusline+=\ %=
" Filetype
set statusline+=\ %y
" Percentage
set statusline+=\ %p%%
" Current line number/Total line numbers
" set statusline+=\ %l/%L
" Errors count
set statusline+=\ %1*%{LinterStatus()}%*
" Gutentags status
set statusline+=%{gutentags#statusline()}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTRA CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use The Silver Searcher if available
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ABBREVIATIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabbrev art !php artisan

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRLP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When opening multiple files, open the first up to three in the current view
" and stick the rest in hidden buffers
let g:ctrlp_open_multiple_files = '3vr'
" ignore gitignored results
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
:nnoremap <c-b> :CtrlPBuffer<cr>
" look for a .ctrlp file to set the search root
let g:ctrlp_root_markers = ['.ctrlp']
" let g:ctrlp_buffer_func = { 'enter': 'CtrlPBDelete' }
let g:ctrlp_match_window = 'max:20,results:100'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SNIPPETS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.config/nvim/my-snippets/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" inoremap <tab> <c-r>=UltiSnips#ExpandSnippet()<cr>
nnoremap <leader>os :call general#OpenSnippets()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let test#strategy = "dispatch"
let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'dispatch',
  \ 'suite':   'dispatch',
\}
let test#php#phpunit#options = {
  \ 'suite': '--stop-on-failure',
\}
nnoremap <silent> <leader>tf :TestNearest<cr>
nnoremap <silent> <leader>td :TestNearest -strategy=dispatch<cr>
nnoremap <silent> <leader>tt :TestFile<cr>
nnoremap <silent> <leader>tl :TestLast<cr>
nnoremap <silent> <leader>tv :TestVisit<cr>
nnoremap <silent> <leader>ts :TestSuite<cr>
let test#python#runner = 'pytest'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM FUGITIVE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <space>gs :belowright :20Gstatus<cr>
nnoremap <space>gd :Gdiff<cr>
nnoremap <space>ge :Gblame<cr>
nnoremap <space>grb :Git rebase -i<space>
nnoremap <space>grc :Git rebase --continue<cr>
nnoremap <space>grm :Git rebase -i origin/master<cr>
nnoremap <space>gw :Gwrite<cr>
nnoremap <space>gb :Git branch<space>
nnoremap <space>gc :Git checkout<space>
nnoremap <space>gm :Gmerge<space>
nnoremap <space>gp :Git push origin HEAD --force-with-lease
nnoremap <space>gl :Git pull<cr>
" merge conflict resolution
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MERGINAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:merginal_splitType=''
let g:merginal_windowSize='15'
nnoremap <space>gb :Merginal<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Only lint when saving or entering a file
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
" Lint error sign
let g:ale_sign_error = '⨉'
" Lint warning sign
let g:ale_sign_warning = '⚠'
" Status line texts
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
let g:ale_sign_column_always = 1
nnoremap <leader>af :ALEFix<cr>

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? '' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM COMMENTARY
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comment map
nmap <leader>c gcc
" Line comment command
xmap <leader>c gc
" Change for // for comments in php
autocmd FileType php setlocal commentstring=//\ %s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TERMINAL EMULATOR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap the escape from terminal mode
tnoremap <esc> <c-\><c-n>
" Open the terminal quickly
nnoremap <space>t :call general#OpenTerminal()<cr>
nnoremap <space>T :terminal<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QUICKFIX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open the quickfix
nnoremap <leader>qf :copen<cr>
" Go back through the quickfix window
nnoremap <leader>qo :colder<cr>
" Go back through the quickfix window
nnoremap <leader>qn :cnewer<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUTENTAGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_cache_dir = '~/.config/nvim/gutentags'
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*', '*node_modules*']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SESSIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>sm :SaveSession<space>
nnoremap <leader>so :OpenSession<space>
nnoremap <leader>sd :DeleteSession<space>
nnoremap <leader>sl :echo sessions#ListSessions()<cr>
let g:session_directory = '~/.config/nvim/sessions'
let g:session_autosave = 'no'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FTPLUGIN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>of :call general#OpenFTPlugin()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ACK
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap \ :Ack!<space>
" Search for the word under the cursor
nnoremap <leader>f* :Ack! <cword><cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>sfi :e client/src/apps/SpaceForIdeas/components<cr>
nnoremap <leader>st :e client/src/apps/SuggestionTool<cr>
nnoremap <leader>tr :e config/locales<cr>
nnoremap <leader>fe :e client/src/components<cr>
