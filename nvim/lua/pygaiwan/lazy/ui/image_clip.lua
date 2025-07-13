return {
	"HakonHarnes/img-clip.nvim",
	event = "VeryLazy",
	opts = {
		default = {
			dir_path = vim.fn.expand("~/Documents/obsidian/attachments"),
			prompt_for_file_name = false,
			file_name = "%Y-%m-%d-%H-%M-%S",
			extension = "png",

			use_absolute_path = true,
			relative_template_path = true,
			insert_mode_after_paste = true,

			template = "![]($FILE_PATH)",
		},
	},
	keys = {
		{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
	},
}
