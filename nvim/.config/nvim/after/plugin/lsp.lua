local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()


lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'rust_analyzer',
})


local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        ['<leader>m'] = cmp_action.luasnip_jump_forward(),
    },
})

lsp.set_preferences({
    sign_icons = {}
})


lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<C-j>", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vvr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vvn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>vvf", function() vim.lsp.buf.format() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)
