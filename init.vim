" NEOVIM
" source: https://github.com/jxlil/dotfiles

" Plugins
" -------

call plug#begin(stdpath('config') . "/plugged") 

" typing
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'easymotion/vim-easymotion'
" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" IDE
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Tree
Plug 'preservim/nerdtree'
" Themes
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
" Syntax
Plug 'sheerun/vim-polyglot'
" git 
Plug 'tpope/vim-fugitive'
" Status bar
Plug 'itchyny/lightline.vim'

call plug#end()


" autocomplete
so $DOTFILES/nvim/plugin/coc/coc.vim
let g:coc_config_home="$DOTFILES/nvim/plugin/coc"
" Themes
let g:nord_bold = 0
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_diff_background = 1
let g:nord_uniform_status_lines = 1
" Status bar
so $DOTFILES/nvim/plugin/lightline/lightline.vim


" General
" -------

syntax on
set nocompatible
set cursorline
set rnu
set number
set ruler
colorscheme onedark
set termguicolors
set nowrap

set tabstop=2 shiftwidth=2

" folding
set foldmethod=indent   
set nofoldenable

" Maps
" ----
let mapleader=" "

" ESC
inoremap <C-c> <esc>

" copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" easymotion
map <Leader>s <Plug>(easymotion-s2)

" NERDTree
map <Leader>nt :NERDTreeToggle<cr>

" Tabs
noremap <C-t> :tabnew<cr>
noremap <C-w> :tabclose<cr>
noremap <C-h> :tabp<cr>
noremap <C-l> :tabn<cr>

" FZF
noremap <Leader>f :FZF<cr>

" move to windows
noremap <silent> <leader>h :wincmd h<cr>
noremap <silent> <leader>j :wincmd j<cr>
noremap <silent> <leader>k :wincmd k<cr>
noremap <silent> <leader>l :wincmd l<cr>


