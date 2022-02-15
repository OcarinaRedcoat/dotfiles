"plug vim
call plug#begin('~/local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vitalk/vim-simple-todo'
Plug 'frazrepo/vim-rainbow'
Plug 'vifm/vifm.vim'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/AutoComplPop' 
Plug 'mhinz/vim-startify'
Plug 'vim-latex/vim-latex'
Plug 'tomlion/vim-solidity'

call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" " filetype plugin on
"
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""s
"" => General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
colorscheme gruvbox
set background=dark    " Setting dark mode
set path+=**					" Searches current directory recursively.
set nobackup                    " No auto backups
set noswapfile                  " No
set noshowmode
set number relativenumber       " Display line numbers
syntax enable


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=2                " One tab == two spaces.
set tabstop=4                   " One tab == two spaces.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Uncomment to autostart the NERDTree
"" autocmd vimenter * NERDTree
map <C-o> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Mouse Scrolling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set mouse=nicr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => lightline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Mouse Scrolling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap )h <Plug>GitGutterNextHunk
nmap (h <Plug>GitGutterPrevHunk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Vifm
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>sp :SplitVifm<CR>
map <Leader>dv :DiffVifm<CR>
map <Leader>tv :TabVifm<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap // :BLines<CR>
nmap ?? :Rg<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Splits and Tabbed Files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

"" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Other Stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.brg set filetype=pburg
command! Config execute ":e $MYVIMRC"
