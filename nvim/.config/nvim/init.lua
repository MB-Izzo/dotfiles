require("user.options")
require "user.keymaps"
require "user.plugins"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.lsp.null-ls"
require "user.closetag"
require "user.nvim-tree"
require "user.lspsaga"
require "user.catppuccin"
require "user.dapc"
require "user.dapui"
vim.o.termguicolors = true
-- vim.g.tokyonight_style = "night"
-- vim.cmd "colorscheme tokyonight"
vim.g.airline_theme = "tokyonight"

vim.cmd [[
  augroup personal_stufff
    autocmd!
    autocmd InsertEnter * lua vim.diagnostic.config({virtual_text = false})
  augroup end
]]

vim.cmd [[
  augroup personal_stuff
    autocmd!
    autocmd InsertLeave * lua vim.diagnostic.config({virtual_text = true})
  augroup end
]]
--autocmd InsertEnter execute 'lua vim.diagnostic.config({virtual_text = true})<CR>' 
