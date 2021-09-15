"Muneeb added 24-Oct-17 - basic 
"Muneeb added 27-Nov-18 - intermediate
syntax enable
set number
set showcmd
set showmatch

" System Verilog Sysntax
" Setting the filetype of files - as a precaution 
" :set filetype? to see what filetype is set for a file
autocmd BufRead,BufNewFile *.v,*.vh,*.sv,*.svh,*.vlog,*.log  set filetype=sv 

" SystemRDL syntax
autocmd BufRead,BufNewFile *.rdl set filetype=systemrdl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
"The file VimCompletesMe.vim is used for auto-completing using <tab>
" Dictionary Usage
set dictionary+=~/.vim/etc/sv.dict
set dictionary+=~/.vim/etc/uvm.dict
"set dictionary +=$HOME/.vim/etc/*.dict
"$HOME/.vim/etc
" Enables the VimCompletesMe.vim to use <tab> to search in dictionary
autocmd FileType sv setlocal complete+=k~/.vim/etc/*.dict
" For Line completion use Ctrl-x Ctrl-l

"set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
"set wildignore+=*vim/backups*
"set wildignore+=*sass-cache*
"set wildignore+=*DS_Store*
"set wildignore+=vendor/rails/**
"set wildignore+=vendor/cache/**
"set wildignore+=*.gem
"set wildignore+=log/**
"set wildignore+=tmp/**
"set wildignore+=*.png,*.jpg,*.gif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search related fields
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find the next match as we type the search
set incsearch
" Highlight searches by default
set hlsearch
" Hide the mouse pointer while typing
set mousehide
" ic is shortform of ignorecase - for case-sensitive search do, noic
set ic
" Override the 'ignorecase' option if the search pattern contains 
" upper case characters.
set smartcase


set linespace=3  "Increase the space between lines in vim
set ruler 

" Color schemes to choose from
set t_Co=256 
"colorscheme darkblue
"colorscheme LightColor
"colorscheme JellybeansColor
"colorscheme solarized

"set background=light
"colorscheme PaperColor
"Or using the dark version:
"
"set background=dark
"colorscheme PaperColor

" For setting the font and size
" If don't know the what fonts are supported do as below:
" :set guifont=*
" This will open the gui and u can select the font style

" If you know the font style and size
"set guifont=Consolas:h12 
"set guifont=DejaVu\ Sans\ Mono\ 14 
" set guifont=Consolas:h12 is the syntax to set font and size, but it might not work for some systems.
" so use set guifont=Consolas\ 12 in those cases instead

" To get available colorscheme in vim do as follows
" :colorscheme [space] [Cntl+d]

if has("gui_running")
  set background=dark
  "macunix        Macintosh version of Vim, using Unix files (OS-X).
  "unix           Unix version of Vim.
  "win32          Win32 version of Vim (MS-Windows 95 and later, 32 or
  "               64 bits)
  "win32unix      Win32 version of Vim, using Unix files (Cygwin)
  if has('unix') 
    "colorscheme darkblue
    colorscheme PaperColor
    "set guifont=Consolas\ 12
    set guifont=DejaVu\ Sans\ Mono\ 13 
  else  
    colorscheme darkblue
    set guifont=Consolas:h12
    "colorscheme PaperColor
  endif
else
  " since the terminal will be dark usually
  " Also, the vim will take the font and style
  " as that of the terminal
  set background=dark
  colorscheme PaperColor
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=50	" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		  " display incomplete commands
set incsearch		" do incremental searching

" Sometimes irritates this. Hence commenting it out
"" map jk and kj to <esc>
"imap jk <esc>
"imap kj <esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn Off Swap Files 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noswapfile
set nobackup
set nowb

" Enabling the matchit.vim
set nocompatible
filetype plugin indent on
runtime macros/matchit.vim

syntax on
set hlsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting the colum width 100 considering UVM library  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let no_of_char_per_line  = 100 
let no_of_lines_per_page = 100 

" we can assign the set options via let-variables only through execute
execute("set colorcolumn=".no_of_char_per_line)
highlight ColorColumn ctermbg=white guibg=grey 

" This code is executed only for GUI application(gvim)
" We can also use ~/.gvimrc file
" First the ~/.vimrc file will be loaded then ~/.gvimrc
if has("gui_running")
  " Automatically wraps the text while coding
  " If things don't work then instead of setlocal do set
  autocmd FileType sv execute ("setlocal textwidth=".(no_of_char_per_line-2))

  " To set the window of a particular size
  " \Note: The values are added with +4 as the window occupies 
  " 4 lines and 4 columns extra  
  execute ("set lines=".(no_of_lines_per_page+4))
  execute ("set columns=".(no_of_char_per_line+4))

endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting the indentation fields
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent
set smarttab
let spaces_per_tab = 2

" The width of a TAB is set to spaces_per_tab.
" Still it is a \t. It is just that
" Vim will interpret it to be having a width of spaces_per_tab.
execute ("set tabstop=".spaces_per_tab)
" Indents will have a width of spaces_per_tab
execute ("set shiftwidth=".spaces_per_tab)
" Sets the number of columns for a TAB
execute ("set softtabstop=".spaces_per_tab)
" Expand TABs to spaces
set expandtab

"" Used for python 
""set et|retab
"" or 
" :retab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Enabling automatic continuation on text, comments to next line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :help formatoptions for more detail
" :set comments? to determine what comments are made of
set formatoptions=tcrq

" To display the tab numbers
set guitablabel=%N/\ %t\ %M

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting the required abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" After entering the abbreviation press space
so $HOME/.vim/etc/abbrev.vim 
call AbbrevFunction()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting the required macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Similar to abbreviations we can have a separate list 
" for storing the macros

" While setting the macros via let, <CR> for new line won't work
" We need to go in insert-mode use Cntl+v and then Enter to get ^M
" End result is @a=:!ls<CR>:!pwd<CR>
"let @a=':!ls
'
"let @a=@a.':!pwd
'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting the required things for Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set tags=./tags; " This is project related tags
set tags=~/.vim/tags/proj_tags

"set tags=~/.vim/tags/proj_tags; " This is project related tags
"set tags+=~/.vim/tags/uvm_tags " UVM library related tags
" ~/.vim/plugin/tag_jump.vim uses <shift-enter> to open a tab
" ~/.vim/plugin/tag_jump.vim uses <control-enter> to close the open tab


"" If this variable is set, augroup is defined, and start highlighting.
let g:hl_matchit_enable_on_vim_startup = 1
"" Highlight ctermbg-terminal color guibg-Gui color
highlight MyGroup ctermbg=blue guibg=peru guifg=wheat
"" you can specify highlight group. see :highlight
let g:hl_matchit_hl_groupname = 'MyGroup'

au BufNewFile,BufRead *.sv,*.svh,*.vh,*.v so ~/.vim/syntax/ver_sv_uvm.vim
au BufNewFile,BufRead *.rdl so ~/.vim/syntax/systemrdl.vim
au BufNewFile,BufRead *.sv,*.svh,*.vh,*.v so ~/.vim/indent/sv/indent.vim
au BufNewFile,BufRead *.sv,*.svh,*.vh,*.v so ~/.vim/ftplugin/sv/folding.vim
au BufNewFile,BufRead *.sv,*.svh so ~/.vim/templates/template_functions.vim

" Required only in windows
au BufNewFile,BufRead *.sv,*.svh,*.vh,*.v so ~/.vim/plugin/tag_jump.vim
au BufNewFile,BufRead *.sv,*.svh,*.vh,*.v so ~/.vim/autoload/hl_matchit.vim
au BufNewFile,BufRead *.sv,*.svh,*.vh,*.v so ~/.vim/plugin/hl_matchit.vim
au BufNewFile,BufRead *.sv,*.svh,*.vh,*.v so ~/.vim/autoload/VimCompletesMe.vim
au BufNewFile,BufRead *.sv,*.svh,*.vh,*.v so ~/.vim/plugin/VimCompletesMe.vim


" Does indent using $HOME/.vim/indent/sv/indent.vim - file in indent will be
" taken autolatically.

"au BufNewFile,BufRead *.sv,*.svh,*.vh,*.v so ~/.vim/autoload/hl_matchit.vim
"au BufNewFile,BufRead *.sv,*.svh,*.vh,*.v so ~/.vim/plugin/hl_matchit.vim
"au BufNewFile,BufRead *.sv,*.svh,*.vh,*.v so ~/.vim/ftplugin/sv/folding.vim

" Instead of this, the file which has to be executed based on language is stored in ftplugin folder. 
" Thus the file is ~/.vim/ftplugin/<language>.vim or ~/.vim/ftplugin/<filetype>.vim
" example - $HOME/.vim/ftplugin/sv.vim

" Vim also supports directories inside ~/.vim/ftplugin/. 
" To continue our example: set filetype=derp will also make Vim run any and all *.vim files inside 
" ~/.vim/ftplugin/derp/. This lets you split up your plugin's ftplugin files into logical groups.
" example - $HOME/.vim/ftplugin/sv/matchit_sv.vim


