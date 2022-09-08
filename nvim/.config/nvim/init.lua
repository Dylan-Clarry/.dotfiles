local set = vim.opt
local Remap = require("dylan/keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

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

-- lua lsp
-- ====
nnoremap('gd', ':lua vim.lsp.buf.definition()<cr>')
nnoremap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nnoremap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nnoremap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nnoremap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nnoremap('gr', ':lua vim.lsp.buf.references()<cr>')
nnoremap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nnoremap('K', ':lua vim.lsp.buf.hover()<cr>')
nnoremap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nnoremap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nnoremap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
