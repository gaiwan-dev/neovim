return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require('dap')

        local function get_venv()
            local venv_path = os.getenv('VIRTUAL_ENV')
            if venv_path then venv_path = venv_path .. '/bin/python' else venv_path = '/usr/local/bin/python3' end
            return venv_path
        end
        -- Python adapter setup
        dap.adapters.python = {
            type = 'executable',
            command = 'python',
            args = { '-m', 'debugpy.adapter' },
        }

        dap.configurations.python = {
            {
                type = 'python',
                request = 'launch',
                name = "Launch file",
                program = "${file}",
                pythonPath = get_venv()

            },
        }

        vim.keymap.set('n', '<leader>sb', dap.toggle_breakpoint)
        vim.keymap.set('n', '<leader>so', dap.step_over)
        vim.keymap.set('n', '<leader>si', dap.step_into)
        vim.keymap.set('n', '<leader>co', dap.continue)
        vim.keymap.set('n', '<leader>in', dap.repl.open)
    end
}
