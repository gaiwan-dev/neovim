return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				ignore = { "*" }, -- Use ruff for linting, exluding all.
				autoImportCompletions = true,
			},
		},
	},
	docs = {
		description = [[
https://github.com/microsoft/pyright

`pyright`, a static type checker and language server for python.
]],
	},
}
