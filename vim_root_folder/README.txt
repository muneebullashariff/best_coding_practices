/////////////////////////////////////////////////
VIMRC:
/////////////////////////////////////////////////
The .vimrc file has to be present in home directory. 

You can go to the home directory:
cd ~ (enter)

Create a .vimrc file in the home directory and copy the contents present in .vimrc_basic file.

/////////////////////////////////////////////////
Syntax:
/////////////////////////////////////////////////
For synatx highlighting you need to create a folder "synatx" inside .vim:
~/.vim/syntax

Then create a file ver_sv_uvm.vim and copyt the contents from the correspoding file from this project and paste it.

The .vimrc file has the following line to invoke the syntax file:
au BufNewFile,BufRead *.sv,*.svh,*.vh,*.v,*.vlog,*.log so ~/.vim/syntax/ver_sv_uvm.vim

Note:
In Unix-like operating systems, any file or folder that starts with a dot character (for example, /home/user/.vimrc, /home/user/.vim), 
commonly called a dotfile and dotfolder, is to be treated as hidden – that is, the ls command does not display them unless the -a flag ( ls -a ) is used.
