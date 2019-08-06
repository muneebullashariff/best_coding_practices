"echo "Inside the folding.vim file\n"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1) Using indentation folding method
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" It turns out that by default Vim will ignore lines beginning with a # character 
" when using indent folding. Thus below says ignore nothing while folding 
"setlocal foldmethod=indent
"setlocal foldignore= 
" OR "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2) Using syntax folding method
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The default Vim syntax file has limited 'fold' definitions, so define more.
" define groups that cannot contain the start of a fold
"syn cluster vimNoFold contains=vimComment,vimLineComment,vimCommentString,vimString,vimSynKeyRegion,vimSynRegPat,vimPatRegion,vimMapLhs,vimOperParen,@EmbeddedScript
"syn cluster vimEmbeddedScript contains=vimMzSchemeRegion,vimTclRegion,vimPythonRegion,vimRubyRegion,vimPerlRegion
" 
"" fold while loops
"syn region vimFoldWhile
"      \ start="\<whilem\>"
"      \ end="\<endwhile\>"
"      \ transparent fold
"      \ keepend extend
"      \ containedin=ALLBUT,@vimNoFold
"      \ skip=+"\%(\\"\|[^"]\)\{-}\%("\|$\)\|'[^']\{-}'+ "comment to fix highlight on wiki'
"
"" fold for loops
"syn region vimFoldFor
"      \ start="\<function\>"
"      \ end="\<endfucntion\>"
"      \ transparent fold
"      \ keepend extend
"      \ containedin=ALLBUT,@vimNoFold
"      \ skip=+"\%(\\"\|[^"]\)\{-}\%("\|$\)\|'[^']\{-}'+ "comment to fix highlight on wiki'
"
"setlocal foldmethod=syntax
"setlocal foldenable
"setlocal foldcolumn=3


" MSHA
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3) Using expression folding method - most flexible
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fine-grain control on folding 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open fold when (hor)izintal movement is done like 'l' or left-arrow 
" To open we can do 'zo'
set foldopen=hor

" Close fold at nothing automatically 
" Manually close using 'zc'
set foldclose=

" folding is enabled by default
" We can toggle between yes and no using 'zi'
"set foldenable?
set nofoldenable

" Setting the foldcolumn width
" Set it in the window when u are using while debugging
" Otherwise, it'll consume the window space  
"set foldcolumn=5 
"or set fdc=5

" Set the foldlevel
" (i)  We can set manually as 
" set foldlevel=2 OR set fdl=2
" (ii) We can do this using zm, zM and zR
" \Note: The default value is 0, which means all the all the folds are closed

" To set the fold colors
":highlight Folded guibg=grey guifg=blue
":highlight FoldColumn guibg=darkgrey guifg=blue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions for executing the folding_method=expression 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns the next non-blank line
" returns -2 when there isn't a vaid line number 
function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile

    return -2
endfunction

" Returns the indent level of the line
function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

" Empty list
let g:check_list = []
let g:check_var = 0
let g:flag = 0

" Main function to fold the lines based on indentation 
function! GetPotionFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        "return '-1'
        return '='
    endif

    let this_indent = IndentLevel(a:lnum)
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

    if g:flag ==? 1
        let g:flag = 0
        " to take care of nested folds
        if this_indent > next_indent
          call add(g:check_list,this_indent)
          let g:flag = 1
        endif
        let var_return = g:check_list[0]
        unlet g:check_list[0]
        return '<' . var_return
    elseif this_indent ==? next_indent
        return this_indent
    elseif this_indent > next_indent
        call add(g:check_list,this_indent)
        let g:flag = 1 
        return this_indent
    elseif this_indent < next_indent
        return '>' . next_indent
    endif
endfunction
" For more information please check
" learn VIM Mthe hard way on Advanced folding 
