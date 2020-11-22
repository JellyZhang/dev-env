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







set rtp+=~/.vim/bundle/Vundle.vim
"set rtp+=/usr/local/opt/fzf
call plug#begin('~/.vim/bundle')
Plug 'vim-airline/vim-airline' 
Plug 'connorholyday/vim-snazzy'
Plug 'dracula/vim'
Plug 'itchyny/vim-cursorword'
Plug 'vim-airline/vim-airline-themes'
" Plugin 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
""Plugin 'fholgado/minibufexpl.vim'
Plug 'ryanoasis/vim-devicons'
"Plugin 'bagrat/vim-buffet'
Plug 'mhinz/vim-startify'
Plug 'altercation/vim-colors-solarized'
   
Plug 'deoplete-plugins/deoplete-clang'
""
""
"c++自动格式化
Plug 'rhysd/vim-clang-format'
""
""
"""nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', { 'branch': 'release','do': ':CocInstall -sync coc-prettier'}
Plug 'fatih/vim-go', { 'tag': '*', 'for':'go' }
Plug 'mbbill/undotree'
" 左边栏显示git信息
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
"""edit
"Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
"colorscheme
Plug 'junegunn/seoul256.vim' 
Plug 'yuttie/inkstained-vim'
Plug 'lifepillar/vim-solarized8'

Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'

Plug 'cespare/vim-toml'
call plug#end()

color hybrid


"Compile function 
map r :call CompileRunGcc()<CR>

func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!clang++ -std=c++11  -Weverything % -o %<"
    exec "!./%<"
  elseif &filetype == 'cpp'
    exec "!clang++ -std=c++11  -Weverything % -o %<"
    exec "!./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'go'
    exec "!go run %"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  elseif &filetype == 'go'
        set splitbelow
		:sp
		:term go run %
  endif
endfunc

let g:airline_theme='hybrid'

let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_symbols.notexists = ' ?'
  let g:airline_symbols.dirty='⚡'

" ===
" " === NERDTree
 " ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapActivateNode = "l"
let NERDTreeMapOpenVSplit = "L"
let NERDTreeMapJumpParent = "j"
let NERDTreeMapJumpRoot = "J"
let NERDTreeMenuDown = "k"
let NERDTreeMenuUp = "i"
let NERDTreeMapJumpPrevSibling = "<C-i>"
let NERDTreeMapJumpNextSibling = "<C-k>"

let NERDTreeMapOpenSplit = ""
let NERDTreeMapJumpFirstChild = "gg"
let NERDTreeMapJumpLastChild = "G"
let NERDTreeMapToggleHidden = "H"

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"autocmd VimEnter *  NERDTree
"autocmd VimEnter *
                "\   if !argc()
                "\ |   Startify
                "\ |   NERDTree
                ""\ |   wincmd w
                "\ | endif

let NERDTreeMinimalMenu=1
let NERDTreeCascadeOpenSingleChildDir=1
let NERDTreeCascadeSingleChildDir=1
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
        \ "Staged"    : "✚",
            \ "Untracked" : "✭",
                \ "Renamed"   : "➜",
                    \ "Unmerged"  : "═",
                        \ "Deleted"   : "✖",
                            \ "Dirty"     : "✗",
                                \ "Clean"     : "✔︎",
                                    \ "Unknown"   : "?"
                                        \ }








"" ===
"" === coc
"" ===
"" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
"autocmd BufWritePre *.cc silent :!command clang-format -i %
autocmd FileType c,cpp,cc,h ClangFormatAutoEnable


let g:go_def_mapping_enabled = 0
let g:go_textobj_enabled = 0
nmap gd :GoDef<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use H to show documentation in preview window
nnoremap <silent> H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes



" tagbar
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=0 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>tb :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签

" tagbar
let g:tagbar_map_showproto = ""
let g:tagbar_map_togglecaseinsensitive = ""
let g:tagbar_map_togglefold = "j"
let g:tagbar_map_preview = "l"
let g:tagbar_map_jump = "L"
let g:tagbar_map_openallfolds = "="
let g:tagbar_map_closeallfolds = "-"

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }






"buffer switch"

nmap <leader>1  :b1<CR> 
nmap <leader>2  :b2<CR> 
nmap <leader>3  :b3<CR> 
nmap <leader>4  :b4<CR> 
nmap <leader>5  :b5<CR> 
nmap <leader>6  :b6<CR> 
nmap <leader>7  :b7<CR> 
nmap <leader>8  :b8<CR> 
nmap <leader>9  :b9<CR> 
nmap <leader>0  :b10<CR> 
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <C-X> :bdelete<CR>


" vim-go
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_command = "goimports" " 格式化將預設的 gofmt 替換
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_gopls_complete_unimported = 1

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

let g:godef_split=2

" startify
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]
let g:startify_change_to_vcs_root = 1
"let g:startify_session_persistence    = 1
let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   Recent files'] },
  \ { 'type': 'sessions',  'header': ['   Saved sessions'] },
  \ ]

