-- TODO: review, i think the args might be wrong, see formatter for example.
local utils = require("pygaiwan.lazy.languages.lspconfig.utils")

return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "biomejs" },
			typescript = { "biomejs" },
			javascriptreact = { "biomejs" },
			typescriptreact = { "biomejs" },
			python = { "ruff" },
		}
		local ruff = lint.linters.ruff
		ruff.args = {
			"--config",
			function()
				utils.get_lint_config_path("ruff", "toml")
			end,
			"check",
		}

		local biome = lint.linters.biomejs
		biome.args = {
			"check",
			"--config-path ",
			function()
				utils.get_lint_config_path("biome", "json")
			end,
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>cl", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
