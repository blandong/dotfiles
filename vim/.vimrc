vim9script

#cd ~/Dropbox/Documents/
#tell vim to use login shell, which reads the ~/.bash_profile
#set shell=bash\ -l
set shell=zsh\ -l

set belloff=all
#:h sessionoptions 
set sessionoptions-=globals
set sessionoptions-=localoptions
set sessionoptions-=options

#default leader is \, we change it to comma
g:mapleader = "," # map leader 

#always change pwd while browsing around with netrw
#g:netrw_keepdir = 0
#sort directory/files by time in DESC order by default
g:netrw_sort_by = "time"
g:netrw_sort_direction = "reverse"

#make backspace to delete the text when hit in insert mode - https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set backspace=indent,eol,start

# enable AutoSave on Vim startu
g:auto_save = 1  

#enable mouse support
set mouse=a

set nocompatible            # disable compatibility to old-time vi
#set showmatch               # show matching brackets.
set ignorecase              # case insensitive matching
# When searching try to be smart about cases
set smartcase
#set nowrapscan             # do not wrap around with search
#set hlsearch                # highlight search results
nnoremap <leader>nh :set hls!<CR>
set autoindent              # indent a new line the same amount as the line just typed
#toggle paste and nopaste modes
set pastetoggle=<F5>
set number                  # add line numbers
#show relative line number to current line
#set relativenumber
#Both absolute and relative line numbers are enabled by default, which produces “hybrid” line numbers. When entering insert mode, relative line numbers are turned off, leaving absolute line numbers turned on.
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != 'i' && !bufexists("[Command Line]") | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
:augroup END

#set cc=80                   # set an 80 column border for good coding style
filetype plugin indent on   # allows auto-indenting depending on file type
set tabstop=4               # number of columns occupied by a tab character
set expandtab               # converts tabs to white space
set shiftwidth=4            # width for autoindents
set softtabstop=4           # see multiple spaces as tabstops so <BS> does the right thing
#disable automatic comment insertion
:set formatoptions-=cro

#set last 200 command histories in command mode, we can use up arrow to scroll
#Note that history is not recorded just for the current editing session. It persists even when we quit and relaunch Vim
set history=200

#highlight current line
set cursorline

#enable copying to clipboard
#set clipboard=unnamed
#see help with :h clipboard
#set clipboard+=unnamedplus

# Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

#used for command line completion
#set wildmenu

#wildoptions to replace the wildmenu, now it is using the vertical popup to show matches
set wildmenu wildoptions=pum
set wildmode=longest:full,full

# Always show current position
set ruler


# For regular expressions turn magic on
set magic

#""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# => Colors and Fonts
#""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Enable syntax highlighting
syntax enable

# Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

# Use Unix as the standard file type
set ffs=unix,dos,mac

#always show statusline (even with only single window)
#set laststatus=0

#show full path of file in status line
#set statusline+=%F

#search as characters are entered
set incsearch           

#shellcheck
#automatically open the quickfix window if ShellCheck found any problems with my shell script
au QuickFixCmdPost [^l]* ++nested cwindow
au QuickFixCmdPost    l* ++nested lwindow

# Useful mappings for managing tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove
nnoremap <leader>t<leader> :tabnext
#nnoremap <C-j> :tabprevious<CR>
#nnoremap <C-k> :tabnext<CR>

tnoremap <leader>tn <C-w>:tab ter<cr>
tnoremap <leader>to <C-w>:tabonly!<cr>
tnoremap <leader>tc <C-w>:tabclose!<cr>


# Let 'tl' toggle between this and the last accessed tab
g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * g:lasttab = tabpagenr()


# Opens a new tab with the current buffer's path
# Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/


#""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# => Spell checking
#""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

#https://vi.stackexchange.com/questions/1942/how-to-execute-shell-commands-silently
#make file executable and avoid the "Hit ENTER to continue" prompts  
#<C-l> (or :redraw!) to refresh the screen when back to Vim.
nnoremap <leader>x :silent !chmod +x %<cr><C-l> 

#nnoremap <leader>n :NERDTreeFocus<CR>
#nnoremap <C-n> :NERDTree<CR>
#nnoremap <C-t> :NERDTreeToggle<CR>
#nnoremap <leader>f :NERDTreeFind<CR>


#mapping for fuzzy finder
#nnoremap <C-p> :Files<CR>

#set when clipboard set as unnamedplus
#full pat
#nnoremap <leader>c :let @+ = expand("%:p")<CR>

#relative path
#nnoremap <leader>cc :let @+ = expand("%")<CR>

#just filename
#nnoremap <leader>ccc  :let @+ = expand("%:t")<CR>

#copy selected text to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

#copy current line to system clipboard
nnoremap <leader>yy "+yy

nnoremap <leader><leader>y :let @* = @"<CR>

#cut current line to system clipboard
nnoremap <leader>dd "+dd

#cut selected text to system clipboard
nnoremap <leader>d "+d
vnoremap <leader>d "+d

#copy full path
nnoremap <leader>f :let @* = expand("%:p")<CR>

#relative path
nnoremap <leader>ff :let @* = expand("%")<CR>

#just filename
nnoremap <leader>fff  :let @* = expand("%:t")<CR>

#set path for find to search file, ** matches all subdirectories as well
set path=$PWD/**

#change the cursor between Normal and Insert modes
&t_SI = "\<Esc>]50;CursorShape=1\x7"
&t_SR = "\<Esc>]50;CursorShape=2\x7"
&t_EI = "\<Esc>]50;CursorShape=0\x7"
set ttimeout
set ttimeoutlen=1
set ttyfast


#switch cursor from block in insert mode in vim inside tmux
#if exists('$ITERM_PROFILE')
#  if exists('$TMUX')
#    let &t_SI = "\<Esc>[3 q"
#    let &t_EI = "\<Esc>[0 q"
#  else
#    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
#    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
#  endif
#end

##select text to encode
:vnoremap <leader>ee  :!base64<cr>

#select text to decode 
:vnoremap <leader>dd :!base64 -d<cr> 

#base64 encode and decode the whole file
nnoremap <leader>en :% !base64<cr>
nnoremap <leader>de :% !base64 -d<cr>



#select xml to format
:vnoremap <leader>x  :!xmllint --format -<cr>



nnoremap <leader>vl :vertical resize +50<cr>
nnoremap <leader>vm :vertical resize -50<cr>
nnoremap <leader>sl :resize +20<cr>
nnoremap <leader>sm :resize -20<cr>

#map to filter command history like <Up> and <Down> for <C-p> and <C-n> in #command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>


#switch buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

#map to type number to buffer after ls command 
:nnoremap <leader>ls :ls<cr>:b

#map jk to Esc
inoremap jk <Esc>

nnoremap <leader>o o<ESC>k 
nnoremap <leader>O O<ESC>j 

# source $MYVIMRC reloads the saved $MYVIMRC
:nmap <leader>s :source $MYVIMRC<cr>

# opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <leader>v :e $MYVIMRC<cr>

#map ,n in terminal mode to return to terminal normal mode
:tnoremap <leader>n <C-w>N
:tnoremap <leader>p <C-w>"0
#enter command mode from terminal mode
# :tnoremap <leader>: <C-w>:
:tnoremap <leader>: <C-w>:

:tnoremap <leader>gt <C-w>gt
:tnoremap <leader>gT <C-w>gT

#https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
#cnoremap w!! w !sudo tee > /dev/null %
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

#delete to end of line
cnoremap <C-k> <C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>

#quickfix window mapping
nnoremap ]q :cnext <cr>
nnoremap [q :cprevious <cr>
nnoremap ]l :lnext <cr>
nnoremap [l :lprevious <cr>

# Disable default easymotion mappings
g:EasyMotion_do_mapping = 0 

nmap s <Plug>(easymotion-s)
#two characters search
nmap S <Plug>(easymotion-s2)

#highlight yanked text in milliseconds
g:highlightedyank_highlight_duration = 1000
   
#plugins
plug#begin('~/.vim/plugged')    
#Plug 'preservim/nerdtree'
#Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
#Code and files fuzzy finder
#Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
#Plug 'junegunn/fzf.vim'
Plug '907th/vim-auto-save'
Plug 'romainl/vim-cool'
Plug 'easymotion/vim-easymotion'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'dbakker/vim-paragraph-motion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
plug#end()

colorscheme dracula

#def Eatchar(pat: string): string
#  var c = nr2char(getchar(0))
#  return (c =~ pat) ? '' : c
#enddef


#abbreviations
:iab shebang #! /usr/bin/env bash
:iab ii if [[ ]]; then<CR><CR>fi<Esc>kklllli
:iab els  if [[ ]]; then<CR><CR>else<CR><CR><BS>fi
:iab ei  if [[ ]]; then<CR><CR><BS>elif [[ ]]; then<CR><CR>fi
:iab eie  if [[ ]]; then<CR><CR><BS>elif [[ ]]; then<CR><CR>else<CR><CR><BS>fi
