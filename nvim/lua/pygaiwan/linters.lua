-- TODO: probably better moved to utils
local M = {}
-- Function to determine linter/formatter config
-- it is assumed that that nvim is always started from the root of the project.
-- At some point i might want to generalize it more for different folders.
-- @param tool string
-- @param extension string
function M.get_lint_config_path(tool, extension)
	-- Default to home config
	local generic_config = vim.loop.os_homedir() .. "/.config/" .. tool .. "/" .. tool .. "." .. extension
	local project_config = vim.loop.cwd() .. "/" .. tool .. "." .. extension

	-- Check if config file  exists in the current project
	local f = io.open(project_config, "r")
	if f ~= nil then
		io.close(f)
		generic_config = project_config
	end

	return generic_config
end

-- Create a user command that, when run, shows the path in a notification
vim.api.nvim_create_user_command("ShowRuffPath", function()
	local path = M.get_lint_config_path("ruff", "toml")
	vim.notify("Ruff config path: " .. path, vim.log.levels.INFO)
end, {})

vim.api.nvim_create_user_command("ShowBiomePath", function()
	local path = M.get_lint_config_path("biome", "json")
	vim.notify("Biome config path: " .. path, vim.log.levels.INFO)
end, {})

return M
