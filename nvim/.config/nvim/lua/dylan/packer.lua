-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- The basics
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-lua/plenary.nvim' -- common utilities
    use 'mbbill/undotree'

    -- Colors (mmm)
    use 'gruvbox-community/gruvbox'
    use { 'catppuccin/nvim', as = 'catppuccin' }

    -- Thanks Prime
    use 'ThePrimeagen/git-worktree.nvim'
    use 'ThePrimeagen/harpoon'

    -- autocomplete
    use 'hrsh7th/nvim-cmp' -- Completion
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- nvim lsp
    use 'neovim/nvim-lspconfig'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'jose-elias-alvarez/null-ls.nvim' -- use nvim as a language server to inject lsp diagnostics, code actions, and more via lua
    use 'MunifTanjim/prettier.nvim' -- prettier plugin for nvim's built-in lsp client

    -- autopairs
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'pangloss/vim-javascript'
    use 'mxw/vim-jsx'
end)
