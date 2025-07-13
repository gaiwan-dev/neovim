return {
	"gaiwan-dev/nvim-language-doc",
	branch = "master",

	config = function()
		local lang_doc = require("nvim-language-doc")
		lang_doc.setup({
			lsp = {
				ruff = "pydoc",
				pyright = "pydoc",
			},
			window = { position = "right" },
		})
	end,
	-- vim.keymap.set("n", "<leader>p", "<cmd>ShowDocs<cr>"),
}
