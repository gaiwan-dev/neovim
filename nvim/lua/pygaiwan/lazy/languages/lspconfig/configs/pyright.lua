return {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    -- root_dir = function(fname)
    --     return vim.fn.getcwd()
    -- end,
    -- single_file_support = true,
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            -- pythonPath = vim.fn.getcwd() .. '.venv/bin/python' ,
            analysis = {
                ignore = { '*' }, -- Use ruff for linting, exluding all.
                autoImportCompletions = true,
            },
        },
    },
    docs = {
        description = [[
https://github.com/microsoft/pyright

`pyright`, a static type checker and language server for python.
]],
    },
}
