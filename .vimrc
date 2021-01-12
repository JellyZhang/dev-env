syntax on 
set noswapfile
set nocompatible 
filetype off 
filetype indent on 
filetype plugin on 
filetype plugin indent on 
set mouse =a 
set encoding =utf-8 
let &t_ut='' 
set expandtab
set tabstop =4 
set shiftwidth =4 
set softtabstop =4 
set scrolloff=10 
set tw=0
set ai! "Auto indent  
set cindent 
set ruler 
set indentexpr= 
set foldmethod=indent 
set foldlevel=99 
set laststatus=2 
set autochdir 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif 
"set guifont=Source_Code_Pro:h12 
"set guioptions-=m 
"set guioptions-=T 
set fileencodings=utf-8,chinese,latin-1

let mapleader=" "
set number 
set cursorline 
set backspace=indent,eol,start 
set wrap 
set showcmd
set wildmenu 
set hlsearch 
set incsearch 
exec "nohlsearch" 
set ignorecase 
set smartcase 
set cursorcolumn
" 基于缩进或语法进行代码折叠
set foldmethod=indent
" set foldmethod=syntax 启动 vim 时关闭折叠代码
set nofoldenable 
set showmatch  
set shortmess=atI 
set undofile 
set undodir =~/.vim/undodir
au InsertLeave *.go write




mapclear

map Q :q<CR>
map S :w<CR>

nnoremap j h
nnoremap k j
nnoremap i k

nnoremap a i
nnoremap A a

nnoremap o I
nnoremap O A

nnoremap J 0
nnoremap K 5j
nnoremap I 5k
nnoremap L $

nnoremap Y p

nnoremap = nzz 
nnoremap - Nzz

vnoremap I 5<Up>
vnoremap K 5<Down>
vnoremap L $
vnoremap J 0

vnoremap i <Up>
vnoremap j <Left>
vnoremap k <Down>


" Ctrl + U or E will move up/down the view port without moving the cursor
nnoremap <C-U> 5<C-y>
nnoremap <C-E> 5<C-e>
"  cant work inoremap <C-U> <Esc>5<C-y>a
"inoremap <C-E> <Esc>5<C-e>a

" move cursor to center of window
imap <C-c> <Esc>zza 
nmap <C-c> zz



" windows control 
noremap <LEADER>wnl :set splitright<CR>:vsplit<CR> 
noremap <LEADER>wni :set nosplitbelow<CR>:split<CR> 
noremap <LEADER>wnk :set splitbelow<CR>:split<CR>
noremap <LEADER>wnj :set nosplitright<CR>:vsplit<CR>

map <LEADER>wl <C-w>l 
map <LEADER>wj <C-w>h 
map <LEADER>wi <C-w>k 
map <LEADER>wk <C-w>j

map<LEADER>wrj :vertical resize-5<CR>	
map<LEADER>wrl :vertical resize+5<CR>
map<LEADER>wri :res +5<CR>	
map<LEADER>wrk :res -5<CR>	

 
map<LEADER>wv <C-w>t<C-w>H 
map<LEADER>wh <C-w>t<C-w>K

map<LEADER><CR> :nohlsearch<Cr>


