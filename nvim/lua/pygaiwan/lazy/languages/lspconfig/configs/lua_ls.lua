return {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "bit", "vim", "it", "describe", "before_each", "after_each", "are" },
			},
		},
	},
}
