return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		-- Python adapter setup
		dap.adapters.python = {
			type = "executable",
			command = "python",
			args = { "-m", "debugpy.adapter" },
		}
		-- python path not needed thanks to venv-selector
		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}",
			},
		}
		local wk = require("which-key")
		wk.add({
			{ "<leader>d", group = "Debugger" },
			{ "<leader>db", dap.toggle_breakpoint, desc = "Set Breakpoint", mode = "n" },
			{ "<leader>dn", dap.step_over, desc = "Step Over", mode = "n" },
			{ "<leader>di", dap.step_into, desc = "Step Into", mode = "n" },
			{ "<leader>dc", dap.continue, desc = "Continue", mode = "n" },
			{ "<leader>dr", dap.repl.open, desc = "Open REPL", mode = "n" },
		})
	end,
}
