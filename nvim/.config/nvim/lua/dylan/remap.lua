local Remap = require("dylan/keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- regular keymaps
-- ====
nnoremap('<leader><cr>', ':so %<cr>')
nnoremap('<leader>;e', ':Ex<cr>')
nnoremap('<leader>;r', ':Rex<cr>')

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
