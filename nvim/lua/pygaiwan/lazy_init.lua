local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy modules. 
require("lazy").setup({
    spec = {
        -- lazy.ui is for all plugins around ui, theme, and so on
        { import = "pygaiwan.lazy.ui" },
        -- lazy.vim_utils if for all plugins around vim utilities: harpoon, etc
        { import = "pygaiwan.lazy.vim_utils" },
        -- lazy.languages is for all languages generic plugins: formatting, LSP, linters etc. 
        { import = "pygaiwan.lazy.languages" },
        -- lazy.languages.python is for python specific plugins: DAP, venv selector
        { import = "pygaiwan.lazy.languages.python" },
    },
    change_detection = { notify = false }
})
require("mason").setup()
