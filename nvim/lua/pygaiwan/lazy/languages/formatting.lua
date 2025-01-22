-- Config for formatters and format on save.

local utils = require("pygaiwan.lazy.languages.lspconfig.utils")

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				svelte = { "biome" },
				css = { "biome" },
				html = { "biome" },
				json = { "biome" },
				yaml = { "biome" },
				lua = { "stylua" },
				python = { "ruff" },
			},
			format_on_save = {
				-- will fallback to lsp formatting if conform cannot do it
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
			-- Customize formatters
			formatters = {
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
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "[C]ode [F]ormat" })
	end,
}
