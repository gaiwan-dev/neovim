return {
	"gaiwan-dev/nvim-repl",
	branch = "master",

	config = function()
		local repl = require("nvim-repl")
		repl.setup({
			lsp = {
				ruff = "python3",
				pyright = "python3",
				lua_ls = "lua",
				ts_ls = "node",
			},
			window = {
				position = "bottom",
			},
		})

		vim.keymap.set("n", "<leader>rr", "<cmd>RunRepl<CR>", { desc = "[R]un [R]epl" })
	end,
}
