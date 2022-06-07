set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'BurntSushi/ripgrep'
Plug 'alvan/vim-closetag'
call plug#end()

" Colourscheme
colorscheme gruvbox 

" Transparent background
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" Remaps
let mapleader = " "

" Vim
nnoremap <leader>pv :Vex<CR> :vertical resize 30 <CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" FVF
nnoremap <leader>pg :GFiles<CR>
nnoremap <leader>pf :Files<CR>

" testing
