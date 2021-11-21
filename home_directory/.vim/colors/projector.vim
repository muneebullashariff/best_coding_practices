" Vim color file
"  Maintainer: Morgan Prior
"  Last Change: 
"  Version:
"  Comment: White background with simple colour
"           Sets settings based on $VIMRUNTIM/syntax/syncolor.vim
"           The default colors loaded with syntax enable
 set background=light
 hi clear
 if exists("syntax_on")
   syntax reset
 endif
 let g:colors_name="projector"

 " gvim colors from $VIMRUNTIME/rgb.txt

" Many terminals can only use six different colors (plus black and white).
" Therefore the number of colors used is kept low. It doesn't look nice with
" too many colors anyway.
" Careful with "cterm=bold", it changes the color to bright for some terminals.
" NR-16   NR-8    COLOR NAME ~
" 0       0       Black
" 1       4       DarkBlue
" 2       2       DarkGreen
" 3       6       DarkCyan
" 4       1       DarkRed
" 5       5       DarkMagenta
" 6       3       Brown, DarkYellow
" 7       7       LightGray, LightGrey, Gray, Grey
" 8       0*	    DarkGray, DarkGrey
" 9       4*	    Blue, LightBlue
" 10	    2*	    Green, LightGreen
" 11	    6*	    Cyan, LightCyan
" 12	    1*	    Red, LightRed
" 13	    5*	    Magenta, LightMagenta
" 14	    3*	    Yellow, LightYellow
" 15	    7*	    White
" Constants are strings
" unknown :special, Identifier
" Statements are keywords
" PreProc are Constants NONE, bold 
hi Normal     term=NONE      cterm=NONE      ctermfg=Black       ctermbg=White  gui=NONE      guifg=Black        guibg=White    
hi Comment	  term=bold      cterm=NONE      ctermfg=DarkGreen   ctermbg=NONE   gui=NONE      guifg=DarkSeaGreen guibg=NONE
hi Constant	  term=NONE      cterm=bold      ctermfg=DarkRed     ctermbg=NONE   gui=NONE      guifg=Red          guibg=NONE
hi Special	  term=bold      cterm=NONE      ctermfg=NONE        ctermbg=NONE   gui=NONE      guifg=NONE         guibg=NONE
hi Identifier	term=NONE      cterm=NONE      ctermfg=NONE        ctermbg=NONE   gui=NONE      guifg=NONE         guibg=NONE
hi Statement	term=bold      cterm=bold      ctermfg=DarkBlue    ctermbg=NONE   gui=bold      guifg=Blue         guibg=NONE
hi PreProc	  term=NONE      cterm=NONE      ctermfg=LightBlue   ctermbg=NONE   gui=NONE      guifg=SteelBlue3   guibg=NONE
hi Type		    term=NONE      cterm=NONE      ctermfg=NONE        ctermbg=NONE   gui=bold      guifg=NONE         guibg=NONE
hi Underlined	term=underline cterm=underline ctermfg=NONE                       gui=underline guifg=NONE         
hi Ignore	    term=NONE      cterm=NONE      ctermfg=NONE        ctermbg=NONE   gui=NONE      guifg=NONE         guibg=NONE
hi Error      term=reverse   cterm=NONE      ctermfg=DarkRed     ctermbg=NONE   gui=NONE      guifg=NONE         guibg=NONE
hi Todo		    term=standout  cterm=NONE      ctermfg=DarkRed     ctermbg=NONE   gui=NONE      guifg=NONE         guibg=NONE
