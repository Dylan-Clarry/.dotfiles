local set = vim.opt
local Keymap = require("dylan.keymap")
local nnoremap = Keymap.nnoremap
local vnoremap = Keymap.vnoremap
local inoremap = Keymap.inoremap
local xnoremap = Keymap.xnoremap
local nmap = Keymap.nmap

vim.scriptencoding='utf-8'
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

vim.g.mapleader=" "

-- ColourScheme
vim.cmd("colorscheme gruvbox")
vim.cmd([[highlight Normal ctermbg=none]])
vim.cmd([[highlight NonText ctermbg=none]])
vim.cmd([[highlight SignColumn ctermbg=none]])
vim.cmd([[highlight SignColumn ctermfg=none]])

-- regular keymaps
-- ====
nnoremap('<leader><cr>', ':so %<cr>')
nnoremap('<leader>e', ':Lex<cr>')
nnoremap('<C-d>', '<C-d>zz')
nnoremap('<C-u>', '<C-u>zz')

-- windows
nnoremap('<leader>;v', ':Vex')
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')

-- move highlighted line
vnoremap("J", ":m '>+1<cr>gv=gv")
vnoremap("K", ":m '<-2<cr>gv=gv")

-- do not yank with x
nnoremap('x', '"_x')

-- increment/decrement
nnoremap('+', '<C-a>')
nnoremap('-', '<C-x>')