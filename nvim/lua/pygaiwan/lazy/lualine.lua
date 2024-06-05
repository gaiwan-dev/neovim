return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
        lualine = require('lualine').setup()
        sections = {
            lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
            lualine_b = { 'branch' },
            lualine_c = {
                'diff',
                colored = true,
                diff_color = {
                    added = 'LuaLineDiffAdd',
                    modified = 'LuaLineDiffChange',
                    removed = 'LuaLineDiffDelete',
                },
                symbols = { added = '✅', modified = '✏️', removed = '❌' },
                source = nil,
            }
        }
    end
}
