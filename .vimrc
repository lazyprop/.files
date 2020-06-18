filetype on                  " required

"""""""""""""""""""""""""""""""""""""""
"   Plugins
"""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'preservim/nerdtree'                     " file explorer
Plugin 'christoomey/vim-tmux-navigator'         " use ctrl+h/j/k/l for navigating vim buffers
Plugin 'tomasiser/vim-code-dark'
Plugin 'zacanger/angr.vim'
Plugin 'nanotech/jellybeans.vim'                " jellybeans color scheme
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'vimwiki/vimwiki'
Plugin 'rakr/vim-one'
Plugin 'arcticicestudio/nord-vim'               " nord color scheme
Plugin 'lervag/vimtex'                          " latex plugin for vim
Plugin 'rust-lang/rust.vim'
Plugin 'AlphaMycelium/pathfinder.vim'           " get shortest path to change
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-markdown'                     " display markdown in vim
Plugin 'ryanoasis/vim-devicons'                 " use devicons with vim

call vundle#end()            " required
filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""""
"   general
"""""""""""""""""""""""""""""""""""""""
syntax enable
set tabstop=4
set shiftwidth=4
set expandtab

set relativenumber
set number

filetype indent on
set autoindent
filetype plugin on
set encoding=UTF-8

set splitright  " automatically open new split panes to right
set splitbelow  " automatically open new split panes to below

"""""""""""""""""""
" search options
"""""""""""""""""""
set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.
set ignorecase " Do case insensitive matching
"set smartcase› › " Do smart case matching
set incsearch " Incremental search
set autowrite› › " Automatically save before commands like :next and :make
"set hidden›› " Hide buffers when they are abandoned
"set mouse=a› › " Enable mouse usage (all modes)
set hlsearch " highlight search matches

" disable auto comment on hitting enter
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


"""""""""""""""""""""""""""""""""""""""
"   colorscheme
"""""""""""""""""""""""""""""""""""""""
colorscheme nord


"""""""""""""""""""""""""""""""""""""""
"   nerdtree
"""""""""""""""""""""""""""""""""""""""
noremap <C-n> :NERDTreeToggle<CR>


"""""""""""""""""""""""""""""""""""""""
"   wsl
"""""""""""""""""""""""""""""""""""""""
vnoremap <C-C> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe  <CR><CR>  " copy (write) highlighted text to .vimbuffer
noremap <C-V> :r ~/.vimbuffer<CR>    " paste from buffer
set t_ut=""


""""""""""""""""""""""""""""""""""""""""
"   vimwiki
""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '/mnt/e/kalashnikov/wiki','index': 'Home', 'syntax': 'markdown', 'ext': '.md'}]
