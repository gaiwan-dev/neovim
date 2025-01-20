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

require("lazy").setup({
    spec = {
        { import = "pygaiwan.lazy.ui" },
        { import = "pygaiwan.lazy.vim_utils" },
        { import = "pygaiwan.lazy.languages" },
        { import = "pygaiwan.lazy.languages.python" },
    },
    change_detection = { notify = false }
})
require("mason").setup()
