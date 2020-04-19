function! s:PersonalNotes()
        let l:projectFolder = system("git rev-parse --show-toplevel")[:-2]
        if v:shell_error > 1
          echomsg "Not in a git project"
          return
        endif
        let buffersToToggle = GetPersonalNotesBuffers()
        if len(buffersToToggle) == 0
                let l:personalNotesFilename = projectFolder . "/personal_notes.md"
                execute 'vsplit' l:personalNotesFilename
                wincmd r
        else
                bdelete "personal_notes.md"
        endif
endfunction

function! GetPersonalNotesBuffers()
    let l:blist = getbufinfo({'bufloaded': 1, 'buflisted': 1})
    let l:result = []
    for l:item in l:blist
        let l:file_name = expand("#" . l:item.bufnr . ":t")
        if empty(l:item.name) || file_name != "personal_notes.md"
            continue
        endif
        call add(l:result, shellescape(l:item.name))
    endfor
    return l:result
endfunction

command! PersonalNotes call <SID>PersonalNotes()
map <F7> :PersonalNotes<CR>
