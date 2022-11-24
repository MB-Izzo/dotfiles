local dap = require('dap')
require('nvim-dap-virtual-text').setup()


dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}
dap.configurations.javascript = {
    {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require 'dap.utils'.pick_process,
    },
}
dap.configurations.typescript = {
    {
        type = "node2",
        request = "launch",
        name = "Launch File",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        restart = false,
        protocol = "inspector",
        console = "integratedTerminal",
        outFiles = { "${workspaceFolder}/dist/**/*.js" }
    },
    -- if it goes ham (no idea why sometimes it will eat all CPU)
    -- ps aux grep | node
    -- killall -9 node
}

require("dap-vscode-js").setup({
    node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    -- debugger_path = '/home/mathieu/dev/vscode-js-debug',
    -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "abc" }) do
    require("dap").configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
            -- sourceMaps = true,
            -- pauseForSourceMap = true,
            --  outFiles = { "${workspaceFolder}*.js", "${workspaceFolder}/**/*.js", "!**/node_modules/**" },
            protocol = 'inspector',
            console = 'integratedTerminal',
            -- skipFiles = { "" },
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require 'dap.utils'.pick_process,
            cwd = "${workspaceFolder}",
        }
    }
end

vim.fn.sign_define('DapBreakpoint', { text = "", texthl = "", linehl = "", numhl = "" })
