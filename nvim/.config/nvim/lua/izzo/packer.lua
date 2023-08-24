-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- :so + :PackerSync
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
    use {'nvim-treesitter/playground'}

    -- can not live without this.
    use 'ThePrimeagen/harpoon'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'

    -- themes
    use 'rebelot/kanagawa.nvim'
    use 'Shatur/neovim-ayu'

    -- tools
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'Badhi/nvim-treesitter-cpp-tools'
    use 'simrat39/rust-tools.nvim'

    -- useful
    use 'windwp/nvim-ts-autotag'

    -- others
    use 'rktjmp/lush.nvim'
    use 'segeljakt/vim-silicon'
    use({
        'kylechui/nvim-surround',
        tag = "*", -- omit to use main branch with latest featuers
        config = function()
            require('nvim-surround').setup({})
        end
    })


    -- just for style
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }

    use 'folke/zen-mode.nvim'

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = "v2.x",
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            --{ 'hrsh7th/nvim-cmp' },
            { 'yioneko/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }

    }

end)
