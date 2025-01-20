return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require('dap')

       -- Python adapter setup
        dap.adapters.python = {
            type = 'executable',
            command = 'python',
            args = { '-m', 'debugpy.adapter' },
        }
        -- python path not needed thanks to venv-selector
        dap.configurations.python = {
            {
                type = 'python',
                request = 'launch',
                name = "Launch file",
                program = "${file}",
            },
        }

        vim.keymap.set('n', '<leader>sb', dap.toggle_breakpoint)
        vim.keymap.set('n', '<leader>so', dap.step_over)
        vim.keymap.set('n', '<leader>si', dap.step_into)
        vim.keymap.set('n', '<leader>co', dap.continue)
        vim.keymap.set('n', '<leader>in', dap.repl.open)
    end
}

