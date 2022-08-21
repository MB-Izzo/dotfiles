local opts = { noremap = true, silent = true }
local action = require("lspsaga.codeaction")
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>r", "<cmd>Telescope lsp_references<cr>", opts)
--keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

keymap("n", "<leader>p", ":Format<cr>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

keymap("n", '<C-j>', "<Cmd>Lspsaga diagnostic_jump_next<cr>", opts)
keymap("n", 'K', "<Cmd>Lspsaga hover_doc<cr>", opts)
--keymap("n", '<gd>', "<Cmd>Lspsaga lsp_finder<cr>", opts)
keymap("i", '<C-k>', "<Cmd>Lspsaga signature_help<cr>", opts)
keymap("n", 'gp', "<Cmd>Lspsaga preview_definition<cr>", opts)
keymap("n", 'gr', "<Cmd>Lspsaga rename<cr>", opts)
keymap("n", '<C-f>', "<Cmd>silent !tmux neww tmux-sessionizer<cr>", opts)
-- code action
vim.keymap.set("n", "<leader>ca", action.code_action, { silent = true })
vim.keymap.set("v", "<leader>ca", function()
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
    action.range_code_action()
end, { silent = true })
