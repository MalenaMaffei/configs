set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'shirk/vim-gas'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-scripts/AfterColors.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'tpope/vim-surround'
Plugin 'jaxbot/browserlink.vim'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-commentary'
"Plugin 'Valloric/YouCompleteMe' -> ME PARECE QUE HACE TARDAR TODO
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" set background&
syntax on

set hlsearch
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4

set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch

:set mouse=a

" Speed optimization
set ttyfast
set lazyredraw

" Use system clipboard 
set clipboard+=unnamed

"--onedark theme

" hi Normal ctermbg=none
" highlight NonText ctermbg=none

"--let g:onedark_termcolors=16
colorscheme onedark
set background=dark
hi Normal ctermbg=none
highlight NonText ctermbg=none
highlight Comment ctermfg=DarkGrey
highlight LineNr ctermfg=DarkGrey
"--bling/vim-airline settings---
set laststatus=2
" ver como poner la letra cheta"
"
" ---delimitMate--
let delimitMate_expand_cr = 1
augroup mydelimitMate 
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"----syntastic---
augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_asm_checkers = []
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
"set laststatus=2 " Always display the statusline in all windows
"set showtabline=2 " Always display the tabline, even if there is only one tab
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
"set t_Co=256


set wildmode=longest,list,full
set wildmenu
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


"AIRLINE
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"para que me muester las tabs
let g:airline#extensions#tabline#enabled = 1



"------------NERDTREE---------------
"Lo abre cuando no le pase un archivo
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Lo abre cuando abris un Dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"Toggle tree
map <C-Bslash> :NERDTreeToggle<CR>

"----- EMMET ----
let g:user_emmet_leader_key='<C-E>'
"--------------TAGBAR-----------------
nmap <F8> :TagbarToggle<CR>

"---- MINIMAP ------
let g:minimap_toggle='<leader>t'

"----- CTRLP
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v[\/](node_modules)$'


"-----MOVERSE ENTRE PANES
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"---- MOVERSE ENTRE BUFFERS -----
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

"---- Select all
map <C-a> <esc>ggVG<CR>

"---- Map Control S for save
noremap <silent> <C-W> :update<CR>
vnoremap <silent> <C-W> <C-C>:update<CR>
inoremap <silent> <C-W>  <C-O>:update<CR>

"---- Comment block
vnoremap <silent> <C-k> :Commentary<cr>

let asmsyntax="nasm"

"------------------AUTO COMMANDS ------------"
"Automatically source vimrc file on save.
autocmd BufWritePost ~/.vimrc source %

