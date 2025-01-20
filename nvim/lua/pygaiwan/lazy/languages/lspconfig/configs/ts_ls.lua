local utils = require("pygaiwan.lazy.languages.lspconfig.utils")

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
        root_dir = utils.get_lint_config_path('tsconfig', 'json'),
        single_file_support = true,
    },
}
