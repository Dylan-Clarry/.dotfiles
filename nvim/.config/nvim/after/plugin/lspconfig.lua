local status, lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local util = require "lspconfig/util"

local Keymap = require('dylan.keymap')
local nnoremap = Keymap.nnoremap

-- lSP autocomplete
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- setting vim values
local cmp = require('cmp')

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
        ['<tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

-- LSP server setup
local on_attach = function(client, bufnr)
    -- print(client.name, "attached")

    -- mappings
    -- see ':h vim.lsp.*' for documentation of the below functions
    nnoremap("K", vim.lsp.buf.hover, { buffer = 0 })
    nnoremap("gd", vim.lsp.buf.definition, { buffer = 0 })
    nnoremap("gT", vim.lsp.buf.type_definition, { buffer = 0 })
    nnoremap("gi", vim.lsp.buf.implementation, { buffer = 0 })
    nnoremap("<leader>r", vim.lsp.buf.rename, { buffer = 0 })
    nnoremap("<leader>dn", vim.diagnostic.goto_next, { buffer = 0 })
    nnoremap("<leader>dc", vim.diagnostic.open_float, { buffer = 0 })
    nnoremap("<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    nnoremap("<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })

    if client.server_capabilities.document_formatting then
        vim.cmd([[
            augroup formatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
            autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
            autocmd BufWritePre <buffer> lua OrganizeImports(1000)
            augroup END
        ]])
    end
end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
end

lsp.lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

-- golang
lsp.gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {"gopls"},
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            gofumpt = true,
            analyses = {
                unusedparams = true,
            },
        }
    }
}

-- html/templ
lsp.html.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
        "html",
        "templ"
    }
}

-- htmx
lsp.htmx.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
        "html",
        "templ"
    }
}

-- c#
lsp.omnisharp.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "dotnet", "/home/dylan/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
    enable_editorconfig_support = true,
    enable_ms_build_load_projects_on_demand = false,
    enable_roslyn_analyzers = false,
    organize_imports_on_format = true,
    enable_import_completion = true,
    sdk_include_prereleases = true,
    analyze_open_documents_only = false,
}

-- rust analyzer
lsp.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {
        "rustup", "run", "stable", "rust-analyzer",
    }
}

-- JS/TS
lsp.tsserver.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        -- turn off tsserver formatting, null ls used for prettier/eslint
        client.server_capabilities.document_formatting = false
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
    filetypes = { "javascript", "javascript.jsx", "javascriptreact", "typescript", "typescript.tsx", "typescriptreact" },
    cmd = { "typescript-language-server", "--stdio" }
}

-- tailwind
lsp.tailwindcss.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp.svelte.setup {
    cmd = { "svelteserver", "--stdio" },
    filetypes = { "svelte" },
}

lsp.astro.setup {}

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
--local signs = { Error = "E ", Warn = "W ", Hint = "H ", Info = "I " }
--for type, icon in pairs(signs) do
--    local hl = "DiagnosticSign" .. type
--    vim.fn.sign_define(hl, { text = icon, texthl = "texthl", numhl = "hl" })
--end

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
