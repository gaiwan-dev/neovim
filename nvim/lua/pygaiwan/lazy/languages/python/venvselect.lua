-- Requires the installation of fd.
-- https://github.com/sharkdp/fd?tab=readme-ov-file#installation

local wk = require("which-key")
wk.add({
	{ "<leader>v", group = "Venv", icon = "" },
})

return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python",
	},
	opts = {
		-- Your options go here
		name = ".venv",
		auto_refresh = true,
	},
	branch = "regexp", -- it is the new version for some reason
	event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	keys = {
		-- Keymap to open VenvSelector to pick a venv.
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
		-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
	},
}
