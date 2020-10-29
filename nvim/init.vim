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

" Writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'voldikss/vim-floaterm'

" Languages
Plug 'plasticboy/vim-markdown'
 
" Asthetics
Plug 'fxn/vim-monochrome' 
Plug 'vim-scripts/wombat256.vim'
Plug 'victorze/foo'
Plug 'sheerun/vim-wombat-scheme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Jorengarenar/vim-darkness'
Plug 'owickstrom/vim-colors-paramount'

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

" enable filetype detection, filetype plugin loading and indentation
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

" set system clipboard
"inoremap <C-v>  <C-O>:set paste<CR><C-r>+ <C-O>:set nopaste<CR><left>
"vnoremap <C-c> "+y

nnoremap <Leader>st :Startify<CR>

" use <Esc> to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" use ctrl+backspace to delete previous word
inoremap <C-BS> <C-w>
tnoremap <C-BS> <C-w>
cnoremap <C-BS> <C-w>

" use <Leader>tt to toggle floating terminal
nnoremap <Leader>tt :FloatermToggle<CR>

" enable colors in console nvim
"set termguicolors

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


"""""""""""""""""""""""""""""""""""""""
"   colorscheme
"""""""""""""""""""""""""""""""""""""""
function! AdaptColorscheme()
    highlight clear CursorLine
    highlight Normal ctermbg=none guibg=none
    highlight LineNr ctermbg=none guibg=none
    highlight Folded ctermbg=none guibg=none
    highlight NonText ctermbg=none guibg=none
    highlight SpecialKey ctermbg=none guibg=none
    highlight VertSplit ctermbg=none guibg=none
    highlight SignColumn ctermbg=none guibg=none
endfunction

autocmd ColorScheme * call AdaptColorscheme()

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
let g:vimwiki_global_ext = 0 


""""""""""""""""""""""""""""""""""""""""
"   competitive programming
""""""""""""""""""""""""""""""""""""""""
function InitIO()
    vsplit in
    split out
endfunction

function! InitCP()
    exec "%!cat ~/coolstuff/competitive/template.cpp"
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
let g:startify_bookmarks = [
            \ '~/.config/nvim/',
            \ '~/projects/',
            \ '~/projects/competitive/',
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
