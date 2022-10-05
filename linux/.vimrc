"tell login shell, which reads the ~/.bash_profile
set shell=bash\ -l

"always change pwd while browsing around with netrw
let g:netrw_keepdir = 0

"default leader is \, we change it to comma
let mapleader = "," " map leader to comma

set backspace=indent,eol,start

" enable AutoSave on Vim startu
     let g:auto_save = 1 
set ignorecase 
set nocompatible 

 set smartcase
    set hlsearch                " highlight search results
set tabstop=4            
set expandtab            
set shiftwidth=4         
set softtabstop=4        
 set number                  " add line numbers
:set formatoptions-=cro
set history=200

:augroup numbertoggle
set relativenumber
    :  autocmd!
    :  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != 'i' && !bufexists("[Command Line]") | set rnu   | endif
    :  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
    :augroup END

 set cursorline

    " Set to auto read when a file is changed from the outside
         set autoread
             au FocusGained,BufEnter * checktime

set wildmenu
    set wildmode=longest:full,full
set ruler

set magic

" Enable syntax highlighting
 syntax enable

set encoding=utf8
set ffs=unix,dos,mac
set laststatus=2
set incsearch 


map <leader>ss :setlocal spell!<cr>

nnoremap <leader>x :silent !chmod +x %<cr><C-l> 

nnoremap <leader>yy "+yy
vnoremap <leader>y "+y

nnoremap <leader>f :let @* = expand("%:p")<CR>
nnoremap <leader>ff :let @* = expand("%")<CR>
nnoremap <leader>fff  :let @* = expand("%:t")<CR>

inoremap jk <Esc>

let &t_SI = "\<Esc>[6 q"
"let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

call plug#begin()
Plug '907th/vim-auto-save'
Plug 'romainl/vim-cool'
call plug#end()
