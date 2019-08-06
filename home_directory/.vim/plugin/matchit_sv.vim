" Defining the match pairs related to SV language
":let s:notend = '\%(\<end\s\+\)\@<!'
":let b:match_words = s:notend . '\<if\>:\<else\s\+if\>'
let b:match_words=
                  \ '\<begin\>:\<end\>,' .
                  \ '\<module\>:\<endmodule\>,' .
                  \ '\<class\>:\<endclass\>,' .
                  \ '\<program\>:\<endprogram\>,' .
                  \ '\<clocking\>:\<endclocking\>,' .
                  \ '\<property\>:\<endproperty\>,' .
                  \ '\<sequence\>:\<endsequence\>,' .
                  \ '\<package\>:\<endpackage\>,' .
                  \ '\<covergroup\>:\<endgroup\>,' .
                  \ '\<primitive\>:\<endprimitive\>,' .
                  \ '\<specify\>:\<endspecify\>,' .
                  \ '\<generate\>:\<endgenerate\>,' .
                  \ '\<interface\>:\<endinterface\>,' .
                  \ '\<function\>:\<endfunction\>,' .
                  \ '\<task\>:\<endtask\>,' .
                  \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
                  \ '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
                  \ '^\s*`if\(n\?def\)\?\>:^\s*`else\>:^\s*`endif\>'
                  " This will create ambiguity as after it reaches endif, where should it go
                  " to `ifdef or to `ifndef
                  "\ '`ifndef\>:`else\>:`endif\>,'.  
                  " This creates the issue with if - else if - else and if - else
                  ""\ '\<if\>:\<else\>,'.

