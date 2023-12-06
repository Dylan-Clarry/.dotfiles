require('catppuccin').setup({
    transparent_background = true,
})

function gruvbox(colorscheme)
    vim.g.gruvbox_transparent = true

    vim.cmd("colorscheme " .. colorscheme)

    vim.cmd([[highlight Normal ctermbg=none]])
    vim.cmd([[highlight NonText ctermbg=none]])
    vim.cmd([[highlight SignColumn ctermbg=none]])
    vim.cmd([[highlight SignColumn ctermfg=none]])
end

function catppuccin(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)
    vim.g.catppuccin_flavour = "mocha"
    vim.g.catppuccin_transparent = true
    vim.g.catppuccin_transparent_sidebar = true
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end


-- color set in base init.lua
catppuccin()

-- colrizer (color preview)
require('colorizer').setup()
