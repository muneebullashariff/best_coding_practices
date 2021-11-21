" projector.vim - Quick setup for use of vim on a Projector
" Maintainer: Morgan Prior
" Version 0.1
"
" Install using pathogen (and git submodules
" https://github.com/tpope/vim-pathogen

function! Projector()
  colorscheme projector
  "Switch spelling off (Remove highlighting etc)
  set nospell
  " Clear Highlighting on switch
  let @/ = ""
endfunction

:com! Projector :call Projector()
