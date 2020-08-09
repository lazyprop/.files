filetype on                  " required

"""""""""""""""""""""""""""""""""""""""
"   Plugins
"""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'preservim/nerdtree'
Plugin 'vimwiki/vimwiki'
Plugin 'arcticicestudio/nord-vim'
Plugin 'lervag/vimtex'
Plugin 'rust-lang/rust.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'ryanoasis/vim-devicons'
Plugin 'itchyny/lightline.vim'
Plugin 'michaeljsmith/vim-indent-object'    " add textobjects for indent blocks
Plugin 'neoclide/coc.nvim'

call vundle#end()            " required
filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""""
"   general
"""""""""""""""""""""""""""""""""""""""
syntax enable
syntax on       " enable syntax highlighting based on filetype
set wildignore=*.o,*.obj,*.bak,*.exe
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

set textwidth=80    " wrap text to 80 characters


"""""""""""""""""""
" search
"""""""""""""""""""
set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.
set ignorecase " Do case insensitive matching
"set smartcase› › " Do smart case matching
set incsearch " Incremental search
"set autowrite› › " Automatically save before commands like :next and :make
"set hidden›› " Hide buffers when they are abandoned
"set mouse=a› › " Enable mouse usage (all modes)
set hlsearch
nnoremap <C-l> :set hlsearch!<CR>


"""""""""""""""""""""""""""""""""""""""
"   colorscheme
"""""""""""""""""""""""""""""""""""""""
set colorcolumn=+1  " set colorcolumn to textwidth
augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight ColorColumn cterm=reverse guibg=lightgrey
    " change visual mode highlighting
    autocmd ColorScheme * highlight Visual cterm=reverse guibg=lightgrey
augroup END

colorscheme nord


"""""""""""""""""""""""""""""""""""""""
"   statusline (lightline)
"""""""""""""""""""""""""""""""""""""""
" disable ---INSERT--- showing at the bottom since it is not needed
set noshowmode
set laststatus=2    " IMPORTANT

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
"vnoremap <C-C> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \|
"clip.exe  <CR><CR>  " copy (write) highlighted text to .vimbuffer
"noremap <C-V> :r ~/.vimbuffer<CR>    " paste from buffer
set t_ut=""


""""""""""""""""""""""""""""""""""""""""
"   vimwiki
""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{
            \ 'path': '/mnt/e/kalashnikov/wiki',
            \ 'index': 'Home',
            \ 'syntax': 'markdown',
            \ 'ext': '.md'
            \ }]

" don't consider non vimwiki .md files as vimwiki files
let g:vimwiki_global_ext = 0 


""""""""""""""""""""""""""""""""""""""""
" custom maps
""""""""""""""""""""""""""""""""""""""""

" ctrl+s -> save file
" nnoremap <C-s> <Esc>:w<CR>
" inoremap <C-s> <Esc>:w<CR>

" temporarily disable ctrl+c
inoremap <C-c> <Nop>

" automatically append closing characters
inoremap {<CR>  {<CR>}<Esc>O
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

" get out of {}, (), '' etc
inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

" use TAB to complete when typing words. else insert TABs as usual
function! Tab_Or_Complete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"

""""""""""""""""""""""""""""""""""""""""
"   competitive programming
""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>cp :%!cat /mnt/e/kalashnikov/prog/competitive/template.cpp<CR>
