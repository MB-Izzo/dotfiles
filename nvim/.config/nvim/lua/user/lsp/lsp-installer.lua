local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require('lspconfig')
local lspinstaller = require("nvim-lsp-installer")
lspinstaller.setup{}

for _, server in ipairs(lspinstaller.get_installed_servers()) do
    lspconfig[server.name].setup {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).


