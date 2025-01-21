local wk = require("which-key")
wk.add({
	{ "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Git History", mode = "n" },
})

return {
	"sindrets/diffview.nvim",
}
