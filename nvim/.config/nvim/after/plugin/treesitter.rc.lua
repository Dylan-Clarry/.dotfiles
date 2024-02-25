local configs = require'nvim-treesitter.configs'
configs.setup {
    ensure_installed = { "help", "javascript", "typescript", "c", "lua", "go", "html", "css" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    sync_install = false,
    auto_install = true,
}
