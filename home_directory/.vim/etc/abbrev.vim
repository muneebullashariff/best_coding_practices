" Define your other abbreviations here

"" Used for perforce editing the current file
"" from which this function is called
function! Pe()
  "let file_path = expand('%:p')
  "!p4 edit file_path 
  !p4 edit '%:p' 
endfunction

"" Used for perforce reverting the current file
"" from which this function is called
function! Pr()
  "let file_path = expand('%:p')
  "!p4 edit file_path 
  !p4 revert '%:p' 
endfunction

function AbbrevFunction()
  " After entering the abbreviation press space
  " iab - 'I'nsert 'AB'breviation
  iab ms // MSHA:
  iab td // TODO(mshariff):
  
  " License script
  iab lic 
  \// ############################################################################
  \<CR>
  \<CR>Licensed to the Apache Software Foundation (ASF) under one
  \<CR>or more contributor license agreements.  See the NOTICE file
  \<CR>distributed with this work for additional information
  \<CR>regarding copyright ownership.  The ASF licenses this file
  \<CR>to you under the Apache License, Version 2.0 (the
  \<CR>"License"); you may not use this file except in compliance
  \<CR>with the License.  You may obtain a copy of the License at
  \<CR>
  \<CR>http://www.apache.org/licenses/LICENSE-2.0
  \<CR>
  \<CR>Unless required by applicable law or agreed to in writing,
  \<CR>software distributed under the License is distributed on an
  \<CR>"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  \<CR>KIND, either express or implied.  See the License for the
  \<CR>specific language governing permissions and limitations
  \<CR>under the License.
  \<CR>
  \<CR>############################################################################
  
  "iab com /*<CR><CR>/<Up>

  " For multile-comments '\' is important in each line 
  iab coms  
    \//////////////////////////////////////////////////////////////////////////////////////////////
  \<CR>
  \<CR>////////////////////////////////////////////////////////////////////////////////////////////
  \<Up>
 
  " For multile-comments '\' is important in each line 
  iab com  
    \//--------------------------------------------------------------------------------------------
  \<CR>
  \<CR>--------------------------------------------------------------------------------------------
  \<Up>

  " The comments for variables and for internal comments of 
  " tasks and functions
  iab comv  
    \//-------------------------------------------------------
  \<CR>
  \<CR>-------------------------------------------------------
  \<Up>

endfunction
