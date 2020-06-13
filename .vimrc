filetype on                  " required

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
Plugin 'vimwiki/vimwiki'
Plugin 'rakr/vim-one'
Plugin 'arcticicestudio/nord-vim'
Plugin 'lervag/vimtex'
Plugin 'rust-lang/rust.vim'
Plugin 'AlphaMycelium/pathfinder.vim'
Plugin 'editorconfig/editorconfig-vim'
Bundle 'tpope/vim-markdown'
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"

set t_ut=""  "DO NOT DISABLE ON WHEN USING WINDOWS

syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
set relativenumber
set number
filetype indent on
set autoindent
filetype plugin on

set splitright  " automatically open new split panes to right
set splitbelow  " automatically open new split panes to below

"let python_highlight_all = 1

set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.
set ignorecase " Do case insensitive matching
"set smartcase› › " Do smart case matching
set incsearch " Incremental search
"set autowrite› › " Automatically save before commands like :next and :make
"set hidden›› " Hide buffers when they are abandoned
"set mouse=a› › " Enable mouse usage (all modes)
set hlsearch " highlight search matches
set shortmess=a

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disable auto comment on hitting enter

colorscheme nord

" Necessary when using Jellybeans theme
" Overrides the background colour
"let g:jellybeans_overrides = {
"            \    'background': { 'guibg': '151515' },
"            \}


" Maps
noremap <C-n> :NERDTreeToggle<CR>

vnoremap <C-C> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe  <CR><CR>  " copy (write) highlighted text to .vimbuffer
noremap <C-V> :r ~/.vimbuffer<CR>    " paste from buffer

let g:vimwiki_list = [{'path': '/mnt/e/kalashnikov/wiki','index': 'Home', 'syntax': 'markdown', 'ext': '.wiki'}]


"augroup AutoMake
    "autocmd!

    "autocmd BufWrite *.c, *.cpp  make
    "autocmd QuickFixCmdPost * copen
"augroup END
