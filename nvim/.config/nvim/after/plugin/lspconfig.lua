local status, lsp = pcall(require, 'lspconfig')
if(not status) then return end

local lsp_installer = require("nvim-lsp-installer")
local protocol = require('vim.lsp.protocol')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local Keymap = require('dylan.keymap')
local nnoremap = Keymap.nnoremap
local vnoremap = Keymap.vnoremap
local inoremap = Keymap.inoremap
local xnoremap = Keymap.xnoremap
local nmap = Keymap.nmap

-- lSP autocomplete
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- setting vim values
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-cr>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

-- LSP server setup
local on_attach = function()

    -- mappings
    -- see ':h vim.lsp.*' for documentation of the below functions
    nnoremap("K", vim.lsp.buf.hover, {buffer = 0})
    nnoremap("gd", vim.lsp.buf.definition, {buffer = 0})
    nnoremap("gT", vim.lsp.buf.type_definition, {buffer = 0})
    nnoremap("gi", vim.lsp.buf.implementation, {buffer = 0})
    nnoremap("<leader>r", vim.lsp.buf.rename, {buffer = 0})
    nnoremap("<leader>dn", vim.diagnostic.goto_next, {buffer = 0})
    nnoremap("<leader>dp", vim.diagnostic.goto_prev, {buffer = 0})
    nnoremap("<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer = 0})
end

-- golang
lsp.gopls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

-- JS/TS
lsp.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "javascript", "javascript.jsx", "javascriptreact", "typescript", "typescript.tsx", "typescriptreact" },
    cmd = { "typescript-language-server", "--stdio" }
}

-- tailwind
lsp.tailwindcss.setup {}

lsp.flow.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp.sourcekit.setup {
    on_attach = on_attach,
}

-- Sumneko_lua only works with lsp installer??
lsp_installer.on_server_ready(function(server)
    local opts = {}
    if server.name == "sumneko_lua" then
        opts = {
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim', 'use' }
                    },
                },
            },
        }
    end
    server:setup(opts)
end)

-- diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
}
)

-- diagnostic symbols
--local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
local signs = { Error = "E ", Warn = "W ", Hint = "H ", Info = "I " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = '', numhl = "" })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    update_in_insert = true,
    float = {
        border = "rounded",
        source = "always", -- Or "if_many"
    },
})
