set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" " alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"
" " add all your plugins here (note older versions of Vundle
" " used Bundle instead of Plugin)
"
" " ...

Plugin 'preservim/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tomasiser/vim-code-dark'
Plugin 'zacanger/angr.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"

syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
set number
filetype indent on
set autoindent

"let python_highlight_all = 1

set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.
"set ignorecase›› " Do case insensitive matching
"set smartcase› › " Do smart case matching
"set incsearch› › " Incremental search
"set autowrite› › " Automatically save before commands like :next and :make
"set hidden›› " Hide buffers when they are abandoned
"set mouse=a› › " Enable mouse usage (all modes)

colorscheme jellybeans
let g:jellybeans_overrides = {
            \    'background': { 'guibg': '151515' },
            \}
" Maps
map <C-n> :NERDTreeToggle<CR>

" copy (write) highlighted text to .vimbuffer
vmap <C-C> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe  <CR><CR>
 " paste from buffer
map <C-V> :r ~/.vimbuffer<CR>
