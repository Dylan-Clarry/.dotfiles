local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

local formatting = null_ls.builtins.formatting

local sources = {
    formatting.eslint,
    formatting.prettier,
}

--local on_attach = function(client)
--    if client.resolved_capabilities.document_formatting then
--        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
--    end
--end

null_ls.setup({
    sources = sources,
    on_attach = on_attach
})

-- auto formatting
--local lsp_formatting = function(bufnr)
--    vim.lsp.buf.format({
--        filter = function(client)
--            return client.name == "null-ls"
--        end,
--        bufnr = bufnr,
--    })
--end
--local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
--null_ls.setup {
--    on_attach = function(client, bufnr)
--        --if client.supports_method("textDocument/formatting") then
--        --    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--        --    vim.api.nvim_create_autocmd("BufWritePre", {
--        --        group = augroup,
--        --        buffer = bufnr,
--        --        callback = function()
--        --            lsp_formatting(bufnr)
--        --        end,
--        --    })
--        --end
--
--
--
--        if client.server_capabilities.documentFormattingProvider then
--            vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<cr>")
--            vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
--        end
--
--        if client.server_capabilities.documentRangeFormattingProvider then
--            vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<cr>")
--        end
--    end,
--    sources = {
--        --formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
--        null_ls.builtins.diagnostics.eslint_d.with({
--            diagnostics_format = '[eslint] #{m}\n(#{c})'
--        }),
--        --null_ls.builtins.diagnostics.eslint,
--        null_ls.builtins.diagnostics.zsh
--    }
--}
