"""""""""""""""""""""""""""""""""""""""
"   Plugins
"""""""""""""""""""""""""""""""""""""""
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'AndrewRadev/splitjoin.vim'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'voldikss/vim-floaterm'

" Languages
Plug 'plasticboy/vim-markdown'
Plug 'neovimhaskell/haskell-vim'
Plug 'jsborjesson/vim-uppercase-sql' " technically not a programming language
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
 
" asthetics
Plug 'fxn/vim-monochrome' 
Plug 'vim-scripts/wombat256.vim'
Plug 'victorze/foo'
Plug 'sheerun/vim-wombat-scheme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Jorengarenar/vim-darkness'
Plug 'owickstrom/vim-colors-paramount'

" games
Plug 'rbtnn/vim-game_engine'
Plug 'rbtnn/vim-mario'

call plug#end()

"""""""""""""""""""""""""""""""""""""""
"   general
"""""""""""""""""""""""""""""""""""""""
syntax enable
set wildignore=*.o,*.obj,*.bak,*.exe

set relativenumber
set number

set encoding=UTF-8
set noswapfile " swapfiles are unnecessary and a PITA
set nowrap

filetype plugin indent on

" indentation
set autoindent " maintain current indentation when new line
set tabstop=4
set shiftwidth=4
set expandtab
set nocompatible

set splitright  " automatically open new split panes to right
set splitbelow  " automatically open new split panes to below

let mapleader = " "  " map leader to <Space>

" disable auto comment on hitting enter
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set undofile " enable saving undo history to a file
set autochdir " set current directory to the file currently editing
set autoread "  autoload file changes

" use <Esc> to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" use ctrl+backspace to delete previous word
inoremap <C-h> <C-w>
tnoremap <C-h> <C-w>
cnoremap <C-h> <C-w>

" use <Leader>tt to toggle floating terminal
nnoremap <Leader>tt :FloatermToggle<CR>

" make Y consistent with C and D
nnoremap Y y$

set textwidth=80


""""""""""""""""""""""""""""""""""""""""
" movement
""""""""""""""""""""""""""""""""""""""""
" make J, K, L, and H move the cursor MORE.
nnoremap J }
nnoremap K {
nnoremap L $
nnoremap H ^

" make <c-j>, <c-k>, <c-l>, and <c-h> scroll the screen.
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>
nnoremap <c-l> zl
nnoremap <c-h> zh

" make <a-j>, <a-k>, <a-l>, and <a-h> move to window.
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l
nnoremap <a-h> <c-w>h

"""""""""""""""""""
" search
"""""""""""""""""""
set showcmd " Show (partial) command in status line.
set noshowmatch " Show matching brackets.
set ignorecase " Do case insensitive matching
"set smartcase› › " Do smart case matching
set incsearch " Incremental search
"set autowrite› › " Automatically save before commands like :next and :make
"set hidden›› " Hide buffers when they are abandoned
set mouse=a
set hlsearch

nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" make n always search forward and N backward
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

" make ; always find forward and , backward
nnoremap <expr> ; getcharsearch().forward ? ';' : ','
nnoremap <expr> , getcharsearch().forward ? ',' : ';'

"""""""""""""""""""""""""""""""""""""""
"   colorscheme
"""""""""""""""""""""""""""""""""""""""
function! RemoveBg()
    highlight clear CursorLine
    highlight Normal ctermbg=none guibg=none
    highlight LineNr ctermbg=none guibg=none
    highlight Folded ctermbg=none guibg=none
    highlight NonText ctermbg=none guibg=none
    highlight SpecialKey ctermbg=none guibg=none
    highlight VertSplit ctermbg=none guibg=none
    highlight SignColumn ctermbg=none guibg=none
endfunction

autocmd ColorScheme * call RemoveBg()

set termguicolors
colorscheme wombat256mod


"""""""""""""""""""""""""""""""""""""""
"   statusline (lightline)
"""""""""""""""""""""""""""""""""""""""
" disable statusline. statuslines are unnecessary
set laststatus=0

"""""""""""""""""""""""""""""""""""""""
"   nerdtree
"""""""""""""""""""""""""""""""""""""""
noremap <C-n> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""
"   vimwiki
""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{
            \ 'path': '~/notes/',
            \ 'index': 'home',
            \ 'syntax': 'markdown',
            \ 'ext': '.md',
            \ 'automatic_nexted_syntaxes': 1
            \ }]

" don't consider non vimwiki .md files .vimwiki files
"let g:vimwiki_global_ext = 0 


""""""""""""""""""""""""""""""""""""""""
"   competitive programming
""""""""""""""""""""""""""""""""""""""""
function InitIO()
    vsplit in
    split out
endfunction

function! InitCP()
    exec "%!cat ~/play/competitive/template.cpp"
    write
endfunction

function! AutoTest()
    exec "!g++ ".shellescape("%")
    exec "!./a.out < in > out"
    exec "!rm a.out"
endfunction

autocmd filetype cpp nnoremap <Leader>cp :call InitCP()<CR>
autocmd filetype cpp nnoremap <Leader>io :call InitIO()<CR>
autocmd filetype cpp nnoremap <Leader>mk :w<bar> call AutoTest()<CR>


""""""""""""""""""""""""""""""""""""""""
" vim markdown
""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1 " disable folding
let g:vim_markdown_strikethrough = 1    " use ~~ to strikethrough
" disable automatic indentation when inserting new list item
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 1

let g:vim_markdown_math = 1 " enable LaTeX math


""""""""""""""""""""""""""""""""""""""""
" vim startify
""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>st :Startify<CR>
let g:startify_bookmarks = [
            \ '~/.config/nvim/',
            \ '~/play/',
            \ '~/play/competitive/',
            \ '~/notes/'
            \]

let g:startify_lists = [
            \ {'type': 'bookmarks' , 'header': ['Bookmarks']}
            \]

""""""""""""""""""""""""""""""""""""""""
" writing
""""""""""""""""""""""""""""""""""""""""
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#cursorwrap = 0
augroup writing
    autocmd!
    autocmd FileType markdown,md,mkd call pencil#init()
    autocmd FileType text,txt call pencil#init()
    autocmd FileType vimwiki call pencil#init()
augroup end

""""""""""""""""""""""""""""""""""""""""
" latex
""""""""""""""""""""""""""""""""""""""""
function! ToPdf()
    exec "!pandoc -s -f markdown -t html -c style.css -o output.pdf ".shellescape("%")
endfunction

autocmd filetype markdown,md,mkd nnoremap <Leader>mk :call ToPdf()<CR>

""""""""""""""""""""""""""""""""""""""""
" language
""""""""""""""""""""""""""""""""""""""""
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> <Leader>d :call LanguageClient_textDocument_hover()<CR>
