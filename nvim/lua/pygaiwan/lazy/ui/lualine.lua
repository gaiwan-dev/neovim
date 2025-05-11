-- Customize the line at the bottom of Neovim
local utils = require("pygaiwan.lazy.languages.lspconfig.utils")

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lualine = require("lualine")
		local colors = {
			bg = "#2A2E37",
			fg = "#D3DAE3",
			yellow = "#EBCB8B",
			cyan = "#80C8C8",
			green = "#A3D9A5",
			blue = "#81A1C1",
			red = "#BF616A",
			teal = "#8FBCBB",
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
		insert_left({
			function()
				return "▊"
			end,
			color = { fg = colors.blue },
			padding = { left = 0, right = 1 },
		})

		insert_left({
			"mode",
			padding = { right = 1 },
		})

		insert_left({ "location" })

		insert_left({
			"progress",
			color = { fg = colors.fg, gui = "bold" },
		})

		insert_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			diagnostics_color = {
				error = { fg = colors.red },
				warn = { fg = colors.yellow },
				info = { fg = colors.cyan },
			},
		})

		insert_left({ "diff" })
		insert_left({ "branch", icon = "", color = { fg = colors.blue, gui = "bold" } })
		insert_left({
			function()
				local ft = vim.bo.filetype
				if ft == "python" then
					return "Config: " .. utils.get_lint_config_path("ruff", "toml")
				elseif ft == "javascript" or ft == "typescript" then
					return "Config: " .. utils.get_lint_config_path("biome", "json")
				end
				return ""
			end,
			icon = " ",
			color = { fg = colors.teal },
		})

		insert_left({
			function()
				return "▊"
			end,
			color = { fg = colors.blue },
		})
		insert_left({ "filename", path = 2, icon = " ", color = { fg = colors.blue, gui = "bold" } })

		insert_right({
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
			color = { gui = "bold", fg = colors.yellow },
		})

		insert_right({
			function()
				return "▊"
			end,
			color = { fg = colors.blue },
			padding = { left = 1 },
		})

		lualine.setup(config_table)
	end,
}
