return {
	"pygaiwan/nvim-language-doc",
	branch = "python",

	config = function()
		local lang_doc = require("nvim-language-doc")
		lang_doc.setup({
			lsp = {
				ruff = "python3 -m pydoc",
				pyright = "python3 -m pydoc",
			},
			window = { position = "right" },
		})
	end,
	vim.keymap.set("n", "<leader>p", "<cmd>ShowDocs<cr>"),
}
