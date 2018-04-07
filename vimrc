filetype plugin indent on
syntax on
set term=xterm-256color
set ruler
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
filetype plugin indent on
syntax on
set background=dark
