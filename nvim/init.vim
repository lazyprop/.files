filetype on                  " required

"""""""""""""""""""""""""""""""""""""""
"   Plugins
"""""""""""""""""""""""""""""""""""""""
call plug#begin()


Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'arcticicestudio/nord-vim'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'michaeljsmith/vim-indent-object'    " add textobjects for indent blocks
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'

call plug#end()

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
set noswapfile " vim won't make swap files

set splitright  " automatically open new split panes to right
set splitbelow  " automatically open new split panes to below

let mapleader = " "  " map leader to <Space>


" disable auto comment on hitting enter
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o



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
set mouse=a
set hlsearch
nnoremap <C-l> :set hlsearch!<CR>


"""""""""""""""""""""""""""""""""""""""
"   colorscheme
"""""""""""""""""""""""""""""""""""""""
set colorcolumn=+1  " set colorcolumn to textwidth
augroup MyColors
    autocmd!
    "autocmd ColorScheme * highlight ColorColumn cterm=reverse guibg=lightgrey
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

" don't consider non vimwiki .md files vimwiki files
let g:vimwiki_global_ext = 0 


""""""""""""""""""""""""""""""""""""""""
" custom maps
""""""""""""""""""""""""""""""""""""""""

" ctrl+s -> save file
" nnoremap <C-s> <Esc>:w<CR>
" inoremap <C-s> <Esc>:w<CR>

" temporarily disable ctrl+c
nnoremap <C-c> <Nop>
vnoremap <C-c> <Nop>
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

" use <Esc> to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" use ctrl+backspace to delete previous word
inoremap <C-BS> <C-\><C-o>db



""""""""""""""""""""""""""""""""""""""""
"   competitive programming
""""""""""""""""""""""""""""""""""""""""
function InitIO()
    vsplit in
    split out
endfunction

function! InitCP()
    exec "%!cat /mnt/e/kalashnikov/prog/competitive/template.cpp"
    write
endfunction

function! AutoTest()
    exec "!g++ ".shellescape("%")." -o ".shellescape("%:r")
    exec "!./".shellescape("%:r")." < in | cat > out"
    exec "!rm ".shellescape("%:r")
endfunction

autocmd filetype cpp nnoremap <Leader>cp :call InitCP()<CR>
autocmd filetype cpp nnoremap <Leader>io :call InitIO()<CR>
autocmd filetype cpp nnoremap <Leader>mk :w<bar> call AutoTest()<CR>
