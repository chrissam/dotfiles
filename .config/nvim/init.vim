" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'gruvbox-community/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'ryanoasis/vim-devicons'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'ap/vim-css-color'
Plug 'vimwiki/vimwiki'
"Plug 'itchyny/lightline.vim'
call plug#end()


" Basic settings
syntax on
set tabstop=2 
set expandtab 
set shiftwidth=2 
set smarttab
set smartindent
set ruler
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set exrc
set hidden
set scrolloff=8 
set signcolumn=yes
set showcmd
set number relativenumber 
set nocompatible
filetype plugin on


" PEP 8 standard for python
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix


" Color Scheme
colorscheme solarized


"Change the leader key
let mapleader = " " "map leader to space


" Shortcut for line number
"map <leader>n :set number<CR>
map <leader>nn :set nonumber<CR>


" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcut split opening
nnoremap <leader>h :split<space>
nnoremap <leader>v :vsplit<space>


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" Nerdtree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
      \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
      \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" Flag unnecessary whitespace
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" Youcomplete me settings
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'


" Airline theme
let g:airline_solarized_bg='dark'

" Git fugitive
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>


" Switching tabs
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Go to last active tab
"au TabLeave * let g:lasttab = tabpagenr()
"nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
"vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>


" Vim wiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'path_html': '~/Dropbox/vimwiki/public_html/'}]

