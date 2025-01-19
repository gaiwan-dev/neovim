ENSURE_INSTALLED = { "lua_ls", "pyright", "ts_ls", "biome", "asm_lsp" }

-- TODO: review the dependencies
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "VonHeikemen/lsp-zero.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
    },

    config = function()
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        cmp.setup({
            sources = { { name = "nvim_lsp" } },
            -- TODO: review why this crashes in Lua code
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_extend(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
        })

        require("mason").setup({
            PATH = "append",
        })
        require("mason-lspconfig").setup({
            ensure_installed = ENSURE_INSTALLED,
            handlers = {
                -- This is for setting up servers that are not in the ENSURE_INSTALLED list
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    local config = require("pygaiwan.lazy.languages.lspconfig.configs.lua_ls")
                    config.capabilities = capabilities
                    lspconfig.lua_ls.setup(config)
                end,
                ["ts_ls"] = function()
                    local lspconfig = require("lspconfig")
                    local config = require("pygaiwan.lazy.languages.lspconfig.configs.ts_ls")
                    config.capabilities = capabilities
                    lspconfig.ts_ls.setup(config)
                end,
            }
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local map = function(key, func, desc)
                    vim.keymap.set("n", key, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                map("K", vim.lsp.buf.hover, "Hover Documentation")
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
            end,
        })
    end,
}
