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
keymap("n", "<leader>tt", "<cmd>Telescope grep_string<cr>", opts)
keymap("n", "<leader>d", "<cmd>Telescope diagnostics<cr>", opts)

-- Custom
keymap("n", "<leader>fc", ":Format<cr>", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

keymap("n", "<leader>y", "\"+y", opts)
keymap("v", "<leader>y", "\"+y", opts)

keymap("x", "<leader>p", "\"_dP", opts)

-- Nvim Tree (TODO: replace by fm vim ?)
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

keymap("n", '<C-f>', "<Cmd>silent !tmux neww tmux-sessionizer<cr>", opts)

-- add to p4v
keymap("n", "<leader>ap", ":!p4 edit %:p<cr>", opts)

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
keymap("n", "<leader>h", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "<leader>t", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", "<leader>n", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
keymap("n", "<leader>s", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)
keymap("n", "<leader>ts", ":! tsc<CR>", opts)

