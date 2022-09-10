require "user.options"
require "user.plugins"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.lsp.null-ls"
require "user.closetag"
require "user.nvim-tree"
require "user.catppuccin"
require "user.dapc"
require "user.dapui"
require "user.keymaps"
vim.o.termguicolors = true
vim.cmd [[colorscheme kanagawa]]

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
