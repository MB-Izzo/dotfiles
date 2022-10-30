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
vim.g.gruvbox_material_background = 'hard'
vim.cmd [[colorscheme gruvbox-material]]

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

vim.cmd [[
  augroup dtest
    autocmd!
    autocmd BufRead *.dttest,*.dtsuite set filetype=xml
  augroup end
]]
