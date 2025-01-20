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

        vim.keymap.set("n", "<leader>tr", function()
            neotest.run.run()
        end, { desc = "Run nearest test" })

        vim.keymap.set("n", "<leader>tR", function()
            neotest.run.run(vim.fn.expand("%"))
        end, { desc = "Run all tests in the file" })

        vim.keymap.set("n", "<leader>td", function()
            neotest.run.run({ strategy = "dap" })
        end, { desc = "Run nearest test in debug" })

        vim.keymap.set("n", "<leader>ts", function()
            neotest.summary.toggle()
        end, { desc = "Toggle test summary" })

        vim.keymap.set("n", "<leader>ti", function()
            neotest.output.open()
        end, { desc = "Open detailed output for the nearest test" })
    end,
}
