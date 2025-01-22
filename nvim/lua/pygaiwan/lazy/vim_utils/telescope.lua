return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		require("telescope").setup({})
		local builtin = require("telescope.builtin")

		local wk = require("which-key")
		wk.add({
			{ "<leader>s", group = "Search", icon = "" },
			{ "<leader>sh", builtin.help_tags, desc = "[S]earch [H]elp", mode = "n" },
			{ "<leader>sk", builtin.keymaps, desc = "[S]earch [K]eymaps", mode = "n" },
			{ "<leader>sf", builtin.find_files, desc = "[S]earch [F]iles", mode = "n" },
			{ "<leader>ss", builtin.builtin, desc = "[S]earch [S]elect Telescope", mode = "n" },
			{ "<leader>sw", builtin.grep_string, desc = "[S]earch current [W]ord", mode = "n" },
			{ "<leader>sg", builtin.live_grep, desc = "[S]earch by [g]rep", mode = "n" },
			{ "<leader>sG", builtin.git_files, desc = "[S]earch by [G]it", mode = "n" },
			{ "<leader>sd", builtin.diagnostics, desc = "[S]earch [D]iagnostics", mode = "n" },
			{ "<leader>sr", builtin.resume, desc = "[S]earch [R]esume", mode = "n" },
			{ "<leader>s.", builtin.oldfiles, desc = '[S]earch Recent Files ("." for repeat)', mode = "n" },
			{ "<leader>s<leader>", builtin.buffers, desc = "[ ] Find existing buffers", mode = "n" },
		})
	end,
}
