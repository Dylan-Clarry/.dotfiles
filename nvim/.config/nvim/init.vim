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
Plug 'prettier/vim-prettier'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'pangloss/vim-javascript'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" LaTeX
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
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
nnoremap <leader>pp :e#<cr>

" LaTeX
nnoremap <leader>ll :LLPStartPreview<cr>
autocmd FileType tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'

" CloseTag
let g:closetag_filenames = '*.html, *.xhtml, *.js, *.jsx'
