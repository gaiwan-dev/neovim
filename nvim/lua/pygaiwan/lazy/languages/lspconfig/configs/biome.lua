local get_lint_config_path = require("pygaiwan.linters").get_lint_config_path

return {
	capabilities = capabilities,
	default_config = {
		cmd = { "biome", "lsp-proxy" },
		filetypes = {
			"astro",
			"css",
			"graphql",
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"svelte",
			"typescript",
			"typescript.tsx",
			"typescriptreact",
			"vue",
		},
		root_dir = get_lint_config_path("biome", "json"),
		single_file_support = false,
	},
	docs = {
		description = [[
https://biomejs.dev

Toolchain of the web. [Successor of Rome](https://biomejs.dev/blog/annoucing-biome).

```sh
npm install [-g] @biomejs/biome
```
]],
	},
}
