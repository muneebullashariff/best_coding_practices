""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function: UvmCompTemp
" Template for UVM componet for SystemVerilog language
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function UvmCompTemp(class_name)
    let tmpl_file = "~/.vim/templates/template_uvm_component.sv"
    call LoadTemplate(tmpl_file, a:class_name)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function: UvmObjTemp
" Template for UVM object for SystemVerilog language
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function UvmObjTemp(class_name)
    let tmpl_file = "~/.vim/templates/template_uvm_object.sv"
    call LoadTemplate(tmpl_file, a:class_name)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function: LoadTemplate 
" Loading the template with required substitution
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function LoadTemplate(tmpl_file, class_name)
    exe "0read " . a:tmpl_file
    let substDict = {}
    let substDict["name"] = $USER
    let substDict["date"] = strftime("%Y %b %d %X")
    let substDict["user_classname"] = a:class_name
    let substDict["USER_FILENAME"] = toupper(a:class_name)
    exe '%s/<<\([^>]*\)>>/\=substDict[submatch(1)]/g'
    " Removes the last blank line
    normal Gdd
    " The set nomodified tells Vim that the file was not modified. 
    " That way you can exit the file with :q as long as you don't add additional text. 
    " Usefull if you typed the wrong file name.
    set nomodified
    " Moves the cursor to the firts line
    normal gg
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
