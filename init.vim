" NEOVIM
" source: https://github.com/jxlil/dotfiles

" Plugins
" -------
" vim-plug: https://github.com/junegunn/vim-plug
call plug#begin(stdpath('config') . "/plugged") 

" typing
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'easymotion/vim-easymotion'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
so $DOTFILES/nvim/plugin/coc/coc.vim
let g:coc_config_home="$DOTFILES/nvim/plugin/coc"

" IDE
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Tree
Plug 'preservim/nerdtree'

" Themes
Plug 'arcticicestudio/nord-vim'
let g:nord_bold = 0
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_diff_background = 1
let g:nord_uniform_status_lines = 1


" Status bar
Plug 'itchyny/lightline.vim'
so $DOTFILES/nvim/plugin/lightline/lightline.vim

call plug#end()


" General
" -------

set cursorline
set rnu
set number
set ruler
colorscheme nord

set tabstop=2 shiftwidth=2


" Maps
" ----
let mapleader=","

" quick movement
inoremap II <Esc> I
inoremap AA <Esc> A
inoremap OO <Esc> O

" line modifications
inoremap CC <Esc> C
inoremap SS <Esc> S
inoremap DD <Esc> dd
inoremap UU <Esc> u

" copy to clipboard
vnoremap <C-c> "+y

" easymotion
map <Leader>s <Plug>(easymotion-s2)

" NERDTree
map <Leader>nt :NERDTreeToggle<cr>

" Tabs
noremap <C-t> :tabnew<cr>
noremap <C-w> :tabclose<cr>
noremap <C-left> :tabp<cr>
noremap <C-right> :tabn<cr>

" FZF
noremap <Leader>f :FZF<cr>
