return {
	"mbbill/undotree",
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>u", group = "Undo", icon = "" },
			{ "<leader>ut", "<cmd>UndotreeToggle<CR>", desc = "[U]ndo [T]oggle", mode = "n" },
			-- so far is fine to save to a standard file, maybe at some point it will be better
			-- to make it more dynamic in the home dir to avoid issues with git
			{ "<leader>us", "<cmd>wundo .history.undo<CR>", desc = "[U]ndo [S]ave file", mode = "n" },
			{ "<leader>ur", "<cmd>rundo .history.undo<CR>", desc = "[U]ndo [R]ead file", mode = "n" },
		})
	end,
}
