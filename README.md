Structure:

```
❯ tree
.
├── init.lua
├── lazy-lock.json
└── lua
    └── pygaiwan
        ├── init.lua
        ├── keymaps.lua
        ├── lazy
        │   ├── languages
        │   │   ├── formatting.lua
        │   │   ├── linting.lua
        │   │   ├── lspconfig
        │   │   │   ├── configs
        │   │   │   │   ├── biome.lua
        │   │   │   │   ├── lua_ls.lua
        │   │   │   │   ├── pyright.lua
        │   │   │   │   └── ts_ls.lua
        │   │   │   └── utils.lua
        │   │   ├── lsp.lua
        │   │   ├── python
        │   │   │   ├── debugger.lua
        │   │   │   ├── debugger_ui.lua
        │   │   │   └── venvselect.lua
        │   │   ├── testing.lua
        │   │   └── treesitter.lua
        │   ├── ui
        │   │   ├── indentscope.lua
        │   │   ├── key_suggestion.lua
        │   │   ├── lualine.lua
        │   │   ├── mini_icons.lua
        │   │   ├── nord.lua
        │   │   ├── todo_comments.lua
        │   │   └── trouble.lua
        │   └── vim_utils
        │       ├── gitdiff.lua
        │       ├── harpoon.lua
        │       ├── lazygit.lua
        │       ├── telescope.lua
        │       └── zenmode.lua
        ├── lazy_init.lua
        ├── vim_keymaps.lua
        └── vim_options.lua

```

The `pygaiwan.init` loads all the non-Lazy configurations, while `pygaiwan.lazy_init` inialize Lazy plugins.
Inside `pygaiwan.lazy_init` there is a import for each module:

- `ui` -> for plugins that change or imporve the Neovim UI
- `vim_utils` -> for plugins that enhance the Neovim functionalities
- `languages` -> for plugins that are language generic
- `languages.python` -> for plugins that are python specific.

The following are the plugins used:

- mason
- lazyvim


`ui`:
- `indentscope`: https://github.com/echasnovski/mini.indentscope to provide bar over indentation blocks
- `which-key`: https://github.com/folke/which-key.nvim to provide key helpers toolbar
- `lualine`: https://github.com/nvim-lualine/lualine.nvim for customization of the lower bar of Neovim
- `mini-icons`: https://github.com/echasnovski/mini.icons to render icons/emoji
- `nord`: https://github.com/shaunsingh/nord.nvim as theme
- `todo-comments`: https://github.com/folke/todo-comments.nvim for highlighing keyword like "TODO"
- `trouble`: https://github.com/folke/trouble.nvim for diagnostic and references listing

`vim_utils`:
- `gitdiff`: https://github.com/sindrets/diffview.nvim for easy Git diff and merge management
- `harpoon`: https://github.com/ThePrimeagen/harpoon/ for fast file movement
- `lazygit`: https://github.com/kdheepak/lazygit.nvim for easy access to LazyGit UI
- `telescope`: https://github.com/nvim-telescope/telescope.nvim fuzzy finding utility
- `zenmode`: https://github.com/folke/zen-mode.nvim for Zen Mode interface

`language`:
- `conform`: https://github.com/stevearc/conform.nvim for language formatter management
- `nvim-lspconfig`: https://github.com/neovim/nvim-lspconfig/ for LSP management
- `nvim-lint`: https://github.com/mfussenegger/nvim-lint for language linter management
- `neotest`: https://github.com/nvim-neotest/neotest for testing utility management
- `treesitter`: https://github.com/nvim-treesitter/nvim-treesitter for graphing language for LSP

`python`:
- `nvim-dap`: https://github.com/mfussenegger/nvim-dap for interaction with python DAP
- `nvim-dap-ui`: https://github.com/rcarriga/nvim-dap-ui for python DAP UI
- `venv-selector`: https://github.com/linux-cultist/venv-selector.nvim for venv management


things to do: 

when adding a new language i need to change: 

1. treesitter -> add langauge
2. lsp 
3. formatter -> formatter_by_ft
4. linter
5. debugger (optional)
6. testing:
