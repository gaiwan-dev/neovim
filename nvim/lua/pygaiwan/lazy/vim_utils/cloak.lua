return {
	"laytan/cloak.nvim",
	config = function()
		local cloak = require("cloak")
		cloak.setup({
			enabled = true,
			cloak_character = "*",
			cloak_length = 10,
			patterns = {
				{
					file_pattern = { ".env*" },
					cloak_pattern = { "=.+" },
				},
			},
		})
		vim.keymap.set(
			"n",
			"<leader>cv",
			"<cmd>CloakPreviewLine<cr>",
			{ desc = "[C]loak [V]iew: show token at current line" }
		)
		vim.keymap.set("n", "<leader>cV", "<cmd>CloakToggle<cr>", { desc = "[C]loak [V]iew all file: show all tokens" })
	end,
}
