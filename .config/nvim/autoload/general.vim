function! general#StripTrailingWhiteSpaces()
  if &modifiable
    let l:l = line(".")
    let l:c = col(".")
    %s/\s\+$//e
    call cursor(l:l, l:c)
  endif
endfunction

function! general#CloseAllBuffersApartFromThisOne()
    let list = filter(general#Buflist(), 'v:val != bufname("%")')
    for buffer in list
        exec "bdelete ".buffer
    endfor
endf

function! general#Buflist()
    redir => bufnames
    silent ls
    redir END
    let list = []
    for i in split(bufnames, "\n")
        let buf = split(i, '"' )
        call add(list, buf[-2])
|   endfor
    return list
endfunction

function! general#ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! general#OpenTerminal()
    :vnew
    :terminal
    :startinsert
endf

function! general#CtrlPBDelete()
  nnoremap <buffer> <silent> <c-@> :call <sid>DeleteMarkedBuffers()<cr>
endfunction

function! s:DeleteMarkedBuffers()
  " list all marked buffers
  let marked = ctrlp#getmarkedlist()

  " the file under the cursor is implicitly marked
  if empty(marked)
    call add(marked, fnamemodify(ctrlp#getcline(), ':p'))
  endif

  " call bdelete on all marked buffers
  for fname in marked
    let bufid = fname =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(fname, '\d\+'))
          \ : fnamemodify(fname[2:], ':p')
    exec "silent! bdelete" bufid
  endfor

  " refresh ctrlp
  exec "normal \<F5>"
endfunction

function! general#OpenSnippets()
    let l:path = "~/.config/nvim/my-snippets/Ultisnips/" . &filetype . ".snippets"
    exec "vsp " . l:path
endfunction

function! general#OpenFTPlugin()
    let l:path = "~/.config/nvim/ftplugin/" . &filetype . ".vim"
    exec "vsp " . l:path
endfunction
