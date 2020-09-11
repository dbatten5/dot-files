function! sessions#MakeSession()
    let l:name = inputdialog("Name of new session: ")
    exec "silent! mks! ~/.config/nvim/sessions/" . l:name . ".vim"
    redraw
    echon "Done"
endfunction

function! sessions#GetSessions()
    let l:sessions = split(globpath('~/.config/nvim/sessions', '*'), '\n')
    return map(copy(l:sessions), 'fnamemodify(v:val, ":t:r")')
endfunction

function! sessions#ListSessions()
    let l:session_names = sessions#GetSessions()
    return join(l:session_names, "\n")
endfunction

function! sessions#SourceSession()
    let l:session_names = sessions#GetSessions()
    let l:session_options = sessions#ListSessions()
    let l:choice = confirm("Select session to load", l:session_options, 0)
    exec "source ~/.config/nvim/sessions/" .  l:session_names[l:choice - 1] . ".vim"
endfunction

function! sessions#ClearSessions()
    let l:choice = confirm("Are you sure you want to clear all the sessions?", "&Yes\n&No", 2)
    if l:choice == 1
        let l:sessions = sessions#GetSessions()
        for i in l:sessions
            let l:session_path = "~/.config/nvim/sessions/" . i . ".vim"
            delete(l:session_path)
        endfor
        redraw
        echo "Done"
    endif
endfunction
