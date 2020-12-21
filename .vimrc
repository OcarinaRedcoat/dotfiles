"Pathogen
execute pathogen#infect()

"Enable Syntax
syntax on

"Indentation
filetype plugin indent on

"Theme
"color dracula
set t_ut=""

"Numbers
set number
set relativenumber

set path+=**

"Lightline setup
set laststatus=2

if !has('gui_running')
  set t_Co=256
endif

set noshowmode

" Tabs
set tabstop=2

au BufRead,BufNewFile *.brg set filetype=pburg

"nmap <Leader>a ddggGGo^[<80><fd>a^[pgg   
