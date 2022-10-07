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
    --    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- Treesitter with autotag
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'windwp/nvim-ts-autotag'
    use "p00f/nvim-ts-rainbow"
    use 'nvim-treesitter/nvim-treesitter-context'

    -- use "sbdchd/neoformat"
    use "jose-elias-alvarez/null-ls.nvim" -- formatter and linter
    use "ap/vim-css-color"
    use 'alvan/vim-closetag'
    use 'rhysd/vim-go-impl'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'segeljakt/vim-silicon'

    -- Debuggers
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'mxsdev/nvim-dap-vscode-js'
    use {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps --unsafe-perm=true --allow-root && npm run compile"
    }

    -- Themes
    use 'metalelf0/jellybeans-nvim'
    use 'rebelot/kanagawa.nvim'
    use 'catppuccin/nvim'
    use 'ghifarit53/tokyonight-vim'

    use 'ThePrimeagen/harpoon'
    use 'nvim-lualine/lualine.nvim'
    use 'tpope/vim-commentary'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use 'morhetz/gruvbox'
    use 'sainnhe/gruvbox-material'
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
