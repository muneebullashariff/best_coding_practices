" =============================================================================
" File: tag_jump.vim
" Description: A little plugin making tag jumping behave more like other IDE 
" Mantainer: Shih-Ming Wang (https://github.com/ipod825)
" Url: https://github.com/github.com/ipod825/TagJump
" License: MIT
" =============================================================================


nmap    <S-Enter>    :call PushTag()<CR>
nmap    <C-Enter>    :call PopTag()<CR>

"nnoremap <C-]> :call PushTag()<CR>
"nnoremap <C-t> :call PopTag()<CR>

" To prevent from adding the function definition more than once
if exists('*PushTag')
    finish
endif

fu! FindDup()
    let l:curTab = tabpagenr()
    let l:curBuf = bufnr('%')
    let l:dup = l:curTab
    for t in range(1, tabpagenr('$'))
        if t == l:curTab
            continue
        endif

        for buf in tabpagebuflist(t)
            if buf == curBuf
                let l:dup = t
            endif
        endfor
    endfor

    if l:dup != l:curTab
        return l:dup
    else
        return -1
    endif
endfu

fu! JumpAndClose(target)
    let l:tar = a:target
    if winnr('$')==1 && a:target>tabpagenr()
        let l:tar = l:tar-1
    endif
    close
    exec "tabfirst"
    exec "tabnext ".l:tar
endfu

fu! PushTag()
    let l:buf = bufnr('%')
    execute "tag ".expand("<cword>")
    " if stay in the same buffer, do nothinh more
    if bufnr('%')==l:buf
        return
    endif
    tab split
    tabp
    pop
    tabn
    let l:dup = FindDup()
    if l:dup>0
        let l:buf = bufnr('%')
        let l:tab = tabpagenr()
        exec "tabfirst"
        exec "tabnext ".l:dup
        while bufnr('%') != l:buf
            wincmd w
        endwhile
        call JumpAndClose(l:tab)
    endif
endfu

fu! PopTag()
    pop
    let l:dup = FindDup()
    if l:dup >0
        call JumpAndClose(l:dup)
    endif
endfu
