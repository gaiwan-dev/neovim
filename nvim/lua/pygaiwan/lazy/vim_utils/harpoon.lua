return {
	"theprimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		local wk = require("which-key")
		wk.add({
			{ "<leader>a", group = "Harpoon", icon = "" },
			{ "<leader>aa", mark.add_file, desc = "Add to Harpoon", mode = "n" },
			{ "<leader>ae", ui.toggle_quick_menu, desc = "Open Harpoon", mode = "n" },
		})
		vim.keymap.set("n", "<leader>1", function()
			ui.nav_file(1)
		end, { desc = "Open file in buffer 1" })
		vim.keymap.set("n", "<leader>2", function()
			ui.nav_file(2)
		end, { desc = "Open file in buffer 2" })
		vim.keymap.set("n", "<leader>3", function()
			ui.nav_file(3)
		end, { desc = "Open file in buffer 3" })
		vim.keymap.set("n", "<leader>4", function()
			ui.nav_file(4)
		end, { desc = "Open file in buffer 4" })
		vim.keymap.set("n", "<leader>5", function()
			ui.nav_file(5)
		end, { desc = "Open file in buffer 5" })
	end,
}
