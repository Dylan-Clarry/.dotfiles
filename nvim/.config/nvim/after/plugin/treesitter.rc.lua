local configs = require'nvim-treesitter.configs'
configs.setup {
    ensure_installed = "all", -- "maintained" was not working for whatever reason
    highlight = { -- enable highlighting
      enable = true,
    },
    indent = {
      enable = false, -- default is disabled anyways
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        },
    },
}
