set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'itchyny/lightline.vim'
    Plugin 'itchyny/vim-gitbranch'
    Plugin 'kien/ctrlp.vim'
    Plugin 'ap/vim-buftabline'
    Plugin 'vitalk/vim-shebang'
    Plugin 'ntpeters/vim-better-whitespace'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'chrisbra/Colorizer'
    Plugin 'bfrg/vim-cpp-modern'
call vundle#end()            " required
filetype plugin indent on    " required

" key mapping
" :help key-notation

" For install new plugins type within vim :PluginInstall
" ################### Vim configuration ############################

" ### Colors
set t_Co=256
set encoding=utf8
set bg=dark
colorscheme gruvbox8_soft
syntax on

" ### By default numbers left side vim
set number
set relativenumber
" enable mouse
set mouse=a
set hlsearch
set incsearch
set hidden

" ctrl+s block scroll
" ctrl+p unblock scroll
" shift + i -> show hidden files

" ##################### KeyMaps

" ### KeyMaps for buftabline
nnoremap <C-Right> :bnext<CR>
nnoremap <C-Left> :bprev<CR>
" :Bclose -> close the buffer and let the window open
nnoremap <F2> :w!<CR>
" filetype detect
nnoremap <F6> :filetype detect<CR>
" open shell
nnoremap <F5> :shell<CR>
" Toggle GitGutter
nnoremap <F4> :GitGutterToggle<CR>
nnoremap <F3> gg=G
" ctrl+w change between nerdtree and the file, so i will overwrite this behaviour
nnoremap <C-a> <C-w>w
nnoremap <F1> :NERDTreeToggle<CR>

nnoremap <F7> :ColorToggle<CR>

" Close buffer
nnoremap <C-x> :Bclose<CR>

" tab key and indent -> gg=G
set softtabstop=4
set tabstop=2
set shiftwidth=4
set expandtab

" Always display statusline
set laststatus=2

" Delete the buffer of the file that have been deleted automatically
let NERDTreeAutoDeleteBuffer = 1

" Remove line nerdtree 'Press ? for help'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Automatic close brackets
" <left> set the cursor one position back.
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" Automatic close brackets with enter without new line
inoremap <<CR> <><left>

" Automatic close brackets with enter an a new line
" <ESC> exit from insert mode and O insert another line
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" C/C++ hightlighter
" Disable function highlighting (affects both C and C++ files)
let g:cpp_no_function_highlight = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1
" Enable highlighting of named requirements (C++20 library concepts)
let g:cpp_named_requirements_highlight = 1
let c_no_curly_error = 1

" zc -> close
" zo -> open
" za -> toggle
nnoremap <space> za
""set foldmethod=indent

" Plugin vim-gitbranch
let g:lightline = {
            \ 'colorscheme': 'powerline',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'gitbranch#name'
            \ },
            \ }
" Launch always NERDTree plugin
autocmd StdinReadPre * let s:std_in:1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
