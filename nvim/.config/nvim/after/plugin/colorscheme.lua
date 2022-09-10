require('catppuccin').setup({})

function setColorScheme(colorscheme)
    vim.g.gruvbox_transparent = true
    vim.g.catppuccin_flavour = "mocha"
    vim.g.catppuccin_transparent = true
    vim.g.catppuccin_transparent_sidebar = true

    vim.cmd("colorscheme " .. colorscheme)

    vim.cmd([[highlight Normal ctermbg=none]])
    vim.cmd([[highlight NonText ctermbg=none]])
    vim.cmd([[highlight SignColumn ctermbg=none]])
    vim.cmd([[highlight SignColumn ctermfg=none]])
end

-- color set in base init.lua
setColorScheme(vim.g.dylan_colorscheme)
