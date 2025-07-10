return {
	"nguyenvukhang/nvim-toggler",
	config = function()
		local toggler = require("nvim-toggler")
		toggler.setup({
			remove_default_keybinds = true,
			vim.keymap.set({ "n", "v" }, "<leader>op", toggler.toggle, { desc = "[Op]posite word replacement" }),
		})
	end,
}
