filetype on                  " required

"""""""""""""""""""""""""""""""""""""""
"   Plugins
"""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'preservim/nerdtree'                     " file explorer
Plugin 'christoomey/vim-tmux-navigator'         " use ctrl+h/j/k/l for navigating buffers
Plugin 'vimwiki/vimwiki'
Plugin 'arcticicestudio/nord-vim'               " nord color scheme
Plugin 'lervag/vimtex'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-markdown'                     " markdown syntax highlighting
Plugin 'ryanoasis/vim-devicons'                 " devicons support
Plugin 'itchyny/lightline.vim'                  " statusline plugin

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

" disable auto comment on hitting enter
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

inoremap ;; <Esc>
set timeoutlen=200


"""""""""""""""""""
" search options
"""""""""""""""""""
set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.
set ignorecase " Do case insensitive matching
"set smartcase› › " Do smart case matching
set incsearch " Incremental search
"set autowrite› › " Automatically save before commands like :next and :make
"set hidden›› " Hide buffers when they are abandoned
"set mouse=a› › " Enable mouse usage (all modes)
set hlsearch " highlight search matches



"""""""""""""""""""""""""""""""""""""""
"   colorscheme
"""""""""""""""""""""""""""""""""""""""
colorscheme nord



"""""""""""""""""""""""""""""""""""""""
"   statusline (lightline)
"""""""""""""""""""""""""""""""""""""""
set noshowmode                      " disable ---INSERT--- showing at the bottom since it is not needed
set laststatus=2                    " IMPORTANT

let g:lightline = {
    \ 'colorscheme': 'nord',
    \ 'component_function': {
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightllineFiletype',
    \ },
    \ }

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightllineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction



"""""""""""""""""""""""""""""""""""""""
"   nerdtree
"""""""""""""""""""""""""""""""""""""""
noremap <C-n> :NERDTreeToggle<CR>


"""""""""""""""""""""""""""""""""""""""
"   wsl
"""""""""""""""""""""""""""""""""""""""
"vnoremap <C-C> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe  <CR><CR>  " copy (write) highlighted text to .vimbuffer
"noremap <C-V> :r ~/.vimbuffer<CR>    " paste from buffer
set t_ut=""


""""""""""""""""""""""""""""""""""""""""
"   vimwiki
""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '/mnt/e/kalashnikov/wiki','index': 'Home', 'syntax': 'markdown', 'ext': '.md'}]
