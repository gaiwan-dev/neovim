# Configuration

This repository provides a modular and extensible Neovim configuration using Lazy.nvim and other plugins. Below is the structure of the configuration and the details of the plugins used.

## 📂 File Structure

```plaintext
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

## 🛠️ Configuration Overview

### 🚀 Initialization

- **`pygaiwan.init`**: Loads all the non-Lazy configurations.
- **`pygaiwan.lazy_init`**: Initializes Lazy.nvim plugins and imports the following modules:
  - **`ui`**: Plugins that change or improve the Neovim UI.
  - **`vim_utils`**: Plugins that enhance Neovim functionality.
  - **`languages`**: Plugins for language-generic features.
  - **`languages.python`**: Plugins specific to Python.

### 📦 Plugin Details

#### 📋 Plugin Manager
- [**mason.nvim**](https://github.com/williamboman/mason.nvim): For LSP and DAP management.
- [**lazy.nvim**](https://github.com/folke/lazy.nvim): As the plugin manager.

#### 🎨 `ui` Plugins
- [**mini.indentscope**](https://github.com/echasnovski/mini.indentscope): Provides a visual bar for indentation blocks.
- [**which-key.nvim**](https://github.com/folke/which-key.nvim): Displays keybinding helpers.
- [**lualine.nvim**](https://github.com/nvim-lualine/lualine.nvim): Customizes the status line.
- [**mini.icons**](https://github.com/echasnovski/mini.icons): Renders icons and emojis.
- [**nord.nvim**](https://github.com/shaunsingh/nord.nvim): Provides the Nord theme.
- [**todo-comments.nvim**](https://github.com/folke/todo-comments.nvim): Highlights keywords like `TODO`.
- [**trouble.nvim**](https://github.com/folke/trouble.nvim): For diagnostics and references listing.

#### 🔧 `vim_utils` Plugins
- [**diffview.nvim**](https://github.com/sindrets/diffview.nvim): For Git diff and merge management.
- [**harpoon**](https://github.com/ThePrimeagen/harpoon): For quick file movement.
- [**lazygit.nvim**](https://github.com/kdheepak/lazygit.nvim): Provides an interface for LazyGit.
- [**telescope.nvim**](https://github.com/nvim-telescope/telescope.nvim): Fuzzy finding utility.
- [**zen-mode.nvim**](https://github.com/folke/zen-mode.nvim): Enables Zen Mode.

#### 🌐 `languages` Plugins
- [**conform.nvim**](https://github.com/stevearc/conform.nvim): Manages language formatters.
- [**nvim-lspconfig**](https://github.com/neovim/nvim-lspconfig): LSP configuration.
- [**nvim-lint**](https://github.com/mfussenegger/nvim-lint): Language linting management.
- [**neotest**](https://github.com/nvim-neotest/neotest): Testing utility management.
- [**treesitter**](https://github.com/nvim-treesitter/nvim-treesitter): Provides syntax tree-based features.

#### 🐍 `python` Plugins
- [**nvim-dap**](https://github.com/mfussenegger/nvim-dap): Debug Adapter Protocol (DAP) for Python.
- [**nvim-dap-ui**](https://github.com/rcarriga/nvim-dap-ui): UI for Python DAP.
- [**venv-selector.nvim**](https://github.com/linux-cultist/venv-selector.nvim): Virtual environment management.

---

## ✨ Adding Support for a New Language

Follow the steps below to add support for a new language:

1. Add the language to the `ensure_installed` variable in **`languages.treesitter`**.
2. Add the language in **`languages.lsp`**.
3. *(Optional)* If the LSP requires specific configurations, add them in the `handlers` section.
4. Add the required formatter to `formatters_by_ft` in **`languages.formatting`**.
5. *(Optional)* Add non-standard formatter configurations in `formatters`. Check [Conform.nvim Formatters](https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters) for existing configurations.
6. Add the linter to `linters_by_ft` in **`languages.linting`**.
7. *(Optional)* Add non-standard linter configurations if needed. Check [nvim-lint Linters](https://github.com/mfussenegger/nvim-lint/tree/master/lua/lint/linters) for references.
8. *(Optional)* If a debugger is available, create a folder for the language and add the debugger plugin. Import the new folder in `lazy_init`.
9. *(Optional)* Add a testing adapter in **`languages.testing`**, if available.

