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
let mapleader=","

map <leader>ob :Buffers<CR>

" ESC
inoremap <leader>e <esc>

" copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" easymotion
nnoremap <silent> <A-j> 10<C-e>
nnoremap <silent> <A-k> 10<C-y>
map <Leader>s <Plug>(easymotion-s2)

" NERDTree
map <Leader>nt :NERDTreeToggle<CR>

" Tabs
noremap <C-t> :tabnew<CR>
noremap <C-w> :tabclose<CR>
noremap <C-h> :tabp<CR>
noremap <C-l> :tabn<CR>

" FZF
noremap <Leader>f :FZF<CR>

" move to windows
noremap <silent> <leader>h :wincmd h<CR>
noremap <silent> <leader>j :wincmd j<CR>
noremap <silent> <leader>k :wincmd k<CR>
noremap <silent> <leader>l :wincmd l<CR>

" terminal
function! OpenTerminal()

	execute "vsp term://zsh"
	execute "set nonu"
	execute "set nornu"

	execute "tnoremap <buffer> <leader>t <C-\\><C-n>:q<CR>"
	execute "tnoremap <buffer> <C-n> <C-\\><C-n>"
	execute "tnoremap <buffer> <leader>l <C-\\><C-n>:wincmd l<CR>"
			
	startinsert!

endfunction

nnoremap <silent> <leader>t :call OpenTerminal()<CR>


