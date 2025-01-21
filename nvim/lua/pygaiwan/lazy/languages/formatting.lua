-- Config for formatters and format on save.

local utils = require("pygaiwan.lazy.languages.lspconfig.utils")

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff" },
			javascript = { "biome" },
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
				args = {
					"format",
					"--stdin-filename",
					"$FILENAME",
					"--config",
					utils.get_lint_config_path("ruff", "toml"),
				},
				stdin = true,
			},
			biome = {
				args = {
					"format",
					"--stdin-file-path",
					"$FILENAME",
					"--config-path",
					utils.get_lint_config_path("biome", "josn", true),
				},
				stdin = true,
			},
		},
	},
}
