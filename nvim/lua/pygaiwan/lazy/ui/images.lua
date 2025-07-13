return {
	"folke/snacks.nvim",
	dependencies = {
		"obsidian-nvim/obsidian.nvim",
	},
	---@type snacks.Config
	opts = {
		image = {
			resolve = function(path, src)
				local ok, obsidian = pcall(require, "obsidian.api")
				if ok and obsidian.path_is_note(path) then
					return obsidian.resolve_image_path(src)
				end
			end,
		},
	},
}
