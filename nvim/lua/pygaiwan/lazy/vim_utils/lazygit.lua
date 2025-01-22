local wk = require("which-key")
wk.add({
	{ "<leader>g", group = "Git" },
})

return {

	"kdheepak/lazygit.nvim",
	cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	},
}
