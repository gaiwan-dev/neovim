local utils = require("pygaiwan.lazy.languages.lspconfig.utils")

return {
    "stevearc/conform.nvim",
    -- event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff" },
            javascript = { "biomejs" },
        },
        -- Set default options
        default_format_opts = {
            lsp_format = "fallback",
        },
        -- Set up format-on-save
        format_on_save = { timeout_ms = 500 },
        -- Customize formatters
        formatters = {
            shfmt = {
                prepend_args = { "-i", "2" },

            },
            ruff = {
                prepend_args = {
                    "--config",
                    function()
                        return utils.get_lint_config_path("ruff", "toml")
                    end,
                    "format",
                },
            },
            biomejs = {
                prepend_args = {
                    "format",
                    "--config-path ",
                    function()
                        return utils.get_lint_config_path("biome", "json")
                    end,
                },
            },
        },
    },
}
