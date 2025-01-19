local get_lint_config_path = require("pygaiwan.linters").get_lint_config_path

return {
    "stevearc/conform.nvim",
    -- event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
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
                        return get_lint_config_path("ruff", "toml")
                    end,
                    "format",
                },
            },
            biomejs = {
                prepend_args = {
                    "format",
                    "--config-path ",
                    function()
                        return get_lint_config_path("biome", "json")
                    end,
                },
            },
        },
    },
}
