-- Linting capabilitis

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
			"check",
			"--stdin-filename",
			"$FILENAME",
			"--config",
			utils.get_lint_config_path("ruff", "toml"),
		}

		local biome = lint.linters.biomejs
		biome.args = {
			"lint",
			"--stdin-file-path",
			"$FILENAME",
			"--config-path ",
			utils.get_lint_config_path("biome", "json", true),
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
		end, { desc = "[C]ode [L]inting" })
	end,
}
