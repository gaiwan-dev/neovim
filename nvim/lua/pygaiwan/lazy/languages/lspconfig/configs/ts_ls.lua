local get_lint_config_path = require("pygaiwan.linters").get_lint_config_path

return {
    default_config = {
        init_options = { hostInfo = 'neovim' },
        cmd = { 'typescript-language-server', '--stdio' },
        filetypes = {
            'javascript',
            'javascriptreact',
            'javascript.jsx',
            'typescript',
            'typescriptreact',
            'typescript.tsx',
        },
        root_dir = get_lint_config_path('tsconfig', 'json'),
        single_file_support = true,
    },
}
