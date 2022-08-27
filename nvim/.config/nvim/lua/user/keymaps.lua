local opts = { noremap = true, silent = true }
local action = require("lspsaga.codeaction")
local term_opts = { silent = true }
-- TODO: Move to seperate files for each category

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>v", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>r", "<cmd>Telescope lsp_references<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Custom
keymap("n", "<leader>p", ":Format<cr>", opts)

-- Nvim Tree (TODO: replace by fm vim ?)
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- LSP saga
keymap("n", '<C-j>', "<Cmd>Lspsaga diagnostic_jump_next<cr>", opts)
keymap("n", 'K', "<Cmd>Lspsaga hover_doc<cr>", opts)
keymap("n", 'gp', "<Cmd>Lspsaga preview_definition<cr>", opts)
keymap("n", 'gr', "<Cmd>Lspsaga rename<cr>", opts)
keymap("n", '<C-f>', "<Cmd>silent !tmux neww tmux-sessionizer<cr>", opts)

-- dap
keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<F3>", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F1>", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F2>", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<leader>do", ":lua require'dapui'.open()<CR>", opts)
keymap("n", "<leader>dc", ":lua require'dapui'.close()<CR>", opts)

-- harpoon
keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<leader>j", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "<leader>k", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", "<leader>l", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
keymap("n", "<leader>;", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)
keymap("n", "<leader>ts", ":! tsc<CR>", opts)

-- code action not working
--vim.keymap.set("n", "<leader>ca", action.code_action, { silent = true })
--vim.keymap.set("v", "<leader>ca", function()
--  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
--   action.range_code_action()
--end, { silent = true })
