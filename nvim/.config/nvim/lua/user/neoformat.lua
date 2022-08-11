-- vim.g.neoformat_try_node_exe = 1
vim.g.neoformat_try_formatprg = 1
vim.api.nvim_command([[
augroup NeoformatAutoFormat
autocmd FileType javascript setlocal formatprg=prettier\
                                     \--stdin\
                                     \--print-width\ 80\
                                     \--single-quote\
                                     \--trailing-comma\ es5
autocmd BufWritePre *.js Neoformat
augroup END
]])

