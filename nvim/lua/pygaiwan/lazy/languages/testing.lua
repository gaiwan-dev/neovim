-- Provide testing capabilities for languagtes. So far only python has been tested.
-- They are part of Which Key group "T"

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/neotest-python",
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local neotest = require("neotest")
		neotest.setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					args = { "--log-level", "DEBUG" },
					runner = "pytest",
					pytest_discover_instances = true,
					is_test_file = function(file_path)
						local filename = vim.fn.fnamemodify(file_path, ":t")
						return filename:match("^test_") or filename:match("_test%.py$")
					end,
				}),
			},
		})

		local wk = require("which-key")
		wk.add({
			{ "<leader>t", group = "Tests" },
			{
				"<leader>tr",
				function()
					neotest.run.run()
				end,
				desc = "Run nearest test",
				mode = "n",
			},
			{
				"<leader>tR",
				function()
					neotest.run.run(vim.fn.expand("%"))
				end,
				desc = "Run all tests in the file",
				mode = "n",
			},
			{
				"<leader>td",
				function()
					neotest.run.run({ strategy = "dap" })
				end,
				desc = "Run nearest test in debug",
				mode = "n",
			},
			{
				"<leader>ts",
				function()
					neotest.summary.toggle()
				end,
				desc = "Toggle test summary",
				mode = "n",
			},
			{
				"<leader>ti",
				function()
					neotest.output.open()
				end,
				desc = "Open detailed output of the nearest test",
				mode = "n",
			},
		})
	end,
}
