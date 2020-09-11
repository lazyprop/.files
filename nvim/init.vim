"""""""""""""""""""""""""""""""""""""""
"   Plugins
"""""""""""""""""""""""""""""""""""""""
call plug#begin()


Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
" Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'michaeljsmith/vim-indent-object'    " add textobjects for indent blocks
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'mhinz/vim-startify'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'voldikss/vim-floaterm'
Plug 'mbbill/undotree'
Plug 'plasticboy/vim-markdown'
 
" Asthetics
Plug 'dracula/vim'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'

call plug#end()

filetype plugin indent on    " required
filetype on                  " required


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
set nowrap

set splitright  " automatically open new split panes to right
set splitbelow  " automatically open new split panes to below

let mapleader = " "  " map leader to <Space>

" disable auto comment on hitting enter
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" enable saving undo history to a file
set undofile

" set current directory to the file currently editing
set autochdir

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
" set colorcolumn=+1  " set colorcolumn to textwidth
augroup MyColors
    autocmd!
    "autocmd ColorScheme * highlight ColorColumn cterm=reverse guibg=lightgrey
    " change visual mode highlighting
    " autocmd ColorScheme * highlight Visual cterm=reverse guibg=lightgrey

augroup END

colorscheme onedark


"""""""""""""""""""""""""""""""""""""""
"   statusline (lightline)
"""""""""""""""""""""""""""""""""""""""
" disable ---INSERT--- showing at the bottom since it is not needed
set noshowmode
set laststatus=2    " IMPORTANT

let g:lightline = {
    \ 'colorscheme': 'onedark',
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
"   windows
"""""""""""""""""""""""""""""""""""""""
"vnoremap <C-C> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \|
"clip.exe  <CR><CR>  " copy (write) highlighted text to .vimbuffer
"noremap <C-V> :r ~/.vimbuffer<CR>    " paste from buffer
set t_ut=""

" copy stuff
" let s:clip = '/mnt/c/Windows/System32/clip.exe' 
" if executable(s:clip)
    " augroup WSLYank
        " autocmd!
        " autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    " augroup end
" end

" paste stuff
"map <silent> "=p :r !powershell.exe -Command Get-Clipboard<CR>
"map! <silent> <C-r>= :r !powershell.exe -Command Get-Clipboard<CR>
"noremap "+p :exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')<CR>

" set ctrl+v to paste (nvim-qt)
inoremap <C-v> <C-r>+

""""""""""""""""""""""""""""""""""""""""
"   vimwiki
""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{
            \ 'path': 'E:\kalashnikov\notes',
            \ 'index': 'home',
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
" nnoremap <C-c> <Nop>
" vnoremap <C-c> <Nop>
" inoremap <C-c> <Nop>

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
" set dictionary="/usr/dict/words"

" use <Esc> to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" use ctrl+backspace to delete previous word
inoremap <C-BS> <C-\><C-o>db

" use <Leader>tt to toggle floating terminal
nnoremap <Leader>tt :FloatermToggle<CR>


""""""""""""""""""""""""""""""""""""""""
"   competitive programming
""""""""""""""""""""""""""""""""""""""""
function InitIO()
    vsplit in
    split out
endfunction

function! InitCP()
    exec "%!more E:\kalashnikov\prog\competitive\template.cpp"
    write
endfunction

function! AutoTest()
    exec "!g++ ".shellescape("%")." -o ".shellescape("%:r")
    exec "!.\".shellescape("%:r")." < in | cat > out"
    exec "!del /f /a ".shellescape("%:r")
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
            \ 'C:\Users\Mandee\AppData\Local\nvim\init.vim',
            \ 'E:\kalashnikov\',
            \ 'E:\kalashnikov\prog\competitive\'
            \]

let g:startify_lists = [
            \ {'type': 'bookmarks' , 'header': ['Bookmarks']}
            \]
