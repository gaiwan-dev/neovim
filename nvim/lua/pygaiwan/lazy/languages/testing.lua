return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/neotest-python",
    },
    config = function()
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-python")({
                    dap = { justMyCode = false },
                    args = { "--log-level", "DEBUG" },
                    runner = "pytest",
                    python = ".venv/bin/python",
                    pytest_discover_instances = true,
                    is_test_file = function(file_path)
                        local filename = vim.fn.fnamemodify(file_path, ":t")
                        return filename:match("^test_") or filename:match("_test%.py$")
                    end,
                }),
            },
        })

        -- Key mappings
        vim.keymap.set("n", "<leader>tr", function()
            neotest.run.run()
        end, { desc = "Run nearest test" })

        vim.keymap.set("n", "<leader>tR", function()
            neotest.run.run(vim.fn.expand("%"))
        end, { desc = "Run all tests in the file" })

        vim.keymap.set("n", "<leader>ts", function()
            neotest.summary.toggle()
        end, { desc = "Toggle test summary" })

        vim.keymap.set("n", "<leader>td", function()
            neotest.output.open()
        end, { desc = "Open detailed output for the nearest test" })
    end,
}





-- return {
--     "nvim-neotest/neotest",
--     optional = true,
--     dependencies = {
--         "nvim-neotest/neotest-python",
--     },
--     opts = {
--         adapters = {
--             ["neotest-python"] = {
--                 -- Here you can specify the settings for the adapter, i.e.
--                 -- runner = "pytest",
--                 -- python = ".venv/bin/python",
--                 dap = { justMyCode = false },
--                 -- Command line arguments for runner
--                 -- Can also be a function to return dynamic values
--                 args = { "--log-level", "DEBUG" },
--                 -- Runner to use. Will use pytest if available by default.
--                 -- Can be a function to return dynamic value.
--                 runner = "pytest",
--                 -- Custom python path for the runner.
--                 -- Can be a string or a list of strings.
--                 -- Can also be a function to return dynamic value.
--                 -- If not provided, the path will be inferred by checking for
--                 -- virtual envs in the local directory and for Pipenev/Poetry configs
--                 python = ".venv/bin/python",
--                 -- Returns if a given file path is a test file.
--                 -- NB: This function is called a lot so don't perform any heavy tasks within it.
--                 is_test_file = function(file_path)
--                     local filename = vim.fn.fnamemodify(file_path, ":t") -- Get the file name from the full path
--                     return filename:match("^test_") or filename:match("_test%.py$")
--                 end,
--                 -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
--                 -- instances for files containing a parametrize mark (default: false)
--                 pytest_discover_instances = true,
--             },
--         },
--     },
-- }
