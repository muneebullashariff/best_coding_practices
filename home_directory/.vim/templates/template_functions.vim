"" Like include guards
"" To prevent multiple declaration of the same function(s)
if exists('g:my_template_functions')
  finish
endif

" Note: use function! to override existing functions. 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function: UvmCompTemp
" Template for UVM componet for SystemVerilog language
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! UvmCompTemp(class_name)
    let tmpl_file = "~/.vim/templates/template_uvm_component.sv"
    call LoadTemplate(tmpl_file, a:class_name)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function: UvmObjTemp
" Template for UVM object for SystemVerilog language
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! UvmObjTemp(class_name)
    let tmpl_file = "~/.vim/templates/template_uvm_object.sv"
    call LoadTemplate(tmpl_file, a:class_name)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function: LoadTemplate 
" Loading the template with required substitution
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! LoadTemplate(tmpl_file, class_name)
    " read inserts below the cursor, 
    " {range}read inserts below the specified line. 
    " Using 0 as the {range} inserts at the top of the buffer.
    " $read to the end 
    let usr_template = line(".")-1 . "read " . a:tmpl_file
    exe usr_template

    " Substitute the required fields in the template
    let substDict = {}
    let substDict["name"] = $USER
    let substDict["date"] = strftime("%Y %b %d %X")
    let substDict["user_classname"] = a:class_name
    let substDict["USER_FILENAME"] = toupper(a:class_name)
    exe '%s/<<\([^>]*\)>>/\=substDict[submatch(1)]/g'

    "  '. : Jump to last modification line.
    "  `. : Jump to exact spot in last modification line
    "  Basically jump the cursor to the start of the code that's inserted
    normal `.

    " Removes the last blank line
    "normal Gdd

    " The set nomodified tells Vim that the file was not modified. 
    " That way you can exit the file with :q as long as you don't add additional text. 
    " Usefull if you typed the wrong file name.
    set nomodified

    " Moves the cursor to the firts line
    "normal gg
    " Moves the cursor to the last line
    "normal G
endfunction

"""function AddTemplate(file_name)
"""    let tmpl_file = \"~/.vim/templates/template.sv"
"""    exe \"0read " . tmpl_file
"""    let substDict = {}
"""    let substDict["name"] = $USER
"""    let substDict["date"] = strftime("%Y %b %d %X")
"""    let substDict["user_filename"] = a:file_name
"""    exe '%s/<<\([^>]*\)>>/\=substDict[submatch(1)]/g'
"""    set nomodified
"""    normal G
"""endfunction
"autocmd BufNewFile *.sv,*.svh call AddTemplate("driver_test")

let g:my_template_functions = 1
