local set = vim.opt
local Keymap = require("dylan.keymap")
local nnoremap = Keymap.nnoremap
local vnoremap = Keymap.vnoremap
local inoremap = Keymap.inoremap
local xnoremap = Keymap.xnoremap
local nmap = Keymap.nmap

vim.scriptencoding='utf-8'
vim.filetype.add({ extension = { templ = "templ"} })
set.encoding='utf-8'
set.fileencoding='utf-8'

set.scrolloff=8
set.number=true
set.relativenumber=true
set.tabstop=4
set.softtabstop=4
set.shiftwidth=4
set.expandtab=true
set.hlsearch=false
set.incsearch=true
set.smartindent=true
set.wrap=false
set.cmdheight=1
set.undodir = os.getenv('HOME') .. '/.vim/undodir'
set.undofile = true
set.splitbelow=true
set.splitright=true

vim.g.mapleader=" "

-- regular keymaps
-- ====
nnoremap('<leader><cr>', ':so %<cr>')
nnoremap('<leader>e', ':Ex<cr>')
nnoremap('<C-d>', '<C-d>zz')
nnoremap('<C-u>', '<C-u>zz')
nnoremap('<leader>u', ':UndotreeShow<cr>')
nnoremap('<leader>;r', ':e#<CR>')
nnoremap('<leader>ff', ':lua vim.lsp.buf.formatting()<cr>')
nnoremap('<leader>ca', ':lua vim.lsp.buf.code_action()<cr>')

-- windows
nnoremap('<leader>;v', ':vs<cr>:vertical resize 80<cr>')
nnoremap('<leader>;h', ':sp<cr>')
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')
nnoremap('<C-Left>', ':vertical resize +3<cr>')
nnoremap('<C-Right>', ':vertical resize -3<cr>')
nnoremap('<C-Up>', ':resize +3<cr>')
nnoremap('<C-Down>', ':resize -3<cr>')

-- yank to clipboard
nnoremap('<leader>y', '\"+y')
vnoremap('<leader>y', '\"+y')
nmap('<leader>Y', '\"+Y')

-- delete no cut
nnoremap('<leader>d', '\"_d')
vnoremap('<leader>d', '\"_d')
nnoremap('<leader>c', '\"_c')
vnoremap('<leader>c', '\"_c')

-- formatting
nnoremap('<leader>fp', ':Prettier<cr>')
nnoremap('<leader>ff', ':lua vim.lsp.buf.format()<cr>')

-- move highlighted line
vnoremap("J", ":m '>+1<cr>gv=gv")
vnoremap("K", ":m '<-2<cr>gv=gv")

-- do not yank with x
nnoremap('x', '"_x')

-- increment/decrement
nnoremap('+', '<C-x>')
nnoremap('-', '<C-a>')
