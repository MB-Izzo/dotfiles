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
require "user.keymaps"
require "user.dapc"
require "user.dapui"
vim.o.termguicolors = true
vim.g.gruvbox_material_background = 'hard'
vim.cmd [[colorscheme rose-pine]]

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
