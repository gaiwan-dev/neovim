return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local lualine = require("lualine")
        local colors = {
            bg     = "#2a2e37",
            fg     = "#d3dae3",
            yellow = "#f6d6a7",
            cyan   = "#80c8c8",
            green  = "#a3d9a5",
            blue   = "#a3c9f9",
            red    = "#f4a3a3",
        }


        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand("%:p:h")
                local gitdir = vim.fn.finddir(".git", filepath .. ";")
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        -- Base config
        local config_table = {
            options = {
                component_separators = "",
                section_separators = "",
                theme = {
                    normal = { c = { fg = colors.fg, bg = colors.bg } },
                    inactive = { c = { fg = colors.fg, bg = colors.bg } },
                },
            },
            sections = {
                -- Clear out defaults
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        }

        -- Helper functions to insert components
        local function insert_left(component)
            table.insert(config_table.sections.lualine_c, component)
        end

        local function insert_right(component)
            table.insert(config_table.sections.lualine_x, component)
        end

        -- Left components
        insert_left {
            function()
                return "▊"
            end,
            color = { fg = colors.blue },
            padding = { left = 0, right = 1 },
        }

        insert_left {
            "mode",
            padding = { right = 1 },
        }

        insert_left {
            "filesize",
            cond = conditions.buffer_not_empty,
        }

        insert_left {
            "filename",
            cond = conditions.buffer_not_empty,
            color = { fg = colors.blue, gui = "bold" },
        }

        insert_left { "location" }

        insert_left {
            "progress",
            color = { fg = colors.fg, gui = "bold" },
        }

        insert_left {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " },
            diagnostics_color = {
                error = { fg = colors.red },
                warn  = { fg = colors.yellow },
                info  = { fg = colors.cyan },
            },
        }

        insert_left {
            "diff"
        }
        insert_left {
            "branch",
            icon = "",
            color = { fg = colors.blue, gui = "bold" },
        }

        insert_right {
            function()
                local msg = "No Active Lsp"
                local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
                local clients = vim.lsp.get_clients()
                local lsp_names = {}

                if next(clients) == nil then
                    return msg
                end

                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        table.insert(lsp_names, client.name)
                    end
                end

                if #lsp_names > 0 then
                    return table.concat(lsp_names, ", ")
                else
                    return msg
                end
            end,

            icon = " LSP:",
            color = { fg = "#ffffff", gui = "bold" },
        }

        insert_right {
            function()
                return "▊"
            end,
            color = { fg = colors.blue },
            padding = { left = 1 },
        }

        lualine.setup(config_table)
    end,
}
