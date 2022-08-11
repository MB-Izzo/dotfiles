local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "Carlosiano/vim-synthwave84" -- Synthwave theme
    use "luisiacc/gruvbox-baby" --Gruvbox theme
    use "gruvbox-community/gruvbox"
    use "Everblush/everblush.nvim"
    use "windwp/nvim-autopairs"
    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "glepnir/lspsaga.nvim" 

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- Treesitter with autotag
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'windwp/nvim-ts-autotag'
    use "p00f/nvim-ts-rainbow"

    use "vim-airline/vim-airline" -- status line
    use "vim-airline/vim-airline-themes"
    -- use "sbdchd/neoformat"
    use "jose-elias-alvarez/null-ls.nvim" -- formatter and linter
    use "rust-lang/rust.vim"
    use "ap/vim-css-color"
    use 'alvan/vim-closetag'
    use 'flazz/vim-colorschemes'
    use 'ghifarit53/tokyonight-vim'
    use 'rhysd/vim-go-impl'
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
