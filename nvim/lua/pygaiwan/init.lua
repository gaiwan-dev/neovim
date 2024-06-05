require("pygaiwan.remap")
require("pygaiwan.set")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


return require("lazy").setup({
	{
		-- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {"nvim-lua/plenary.nvim",},
	},
	{
		"shaunsingh/nord.nvim", -- color schema nord
		priority = 1000, -- Make sure to load this before all the other start plugins.
		init = function() vim.cmd.colorscheme("nord") end
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "theprimeagen/harpoon"},
	{ "mbbill/undotree" },
	{ "kdheepak/lazygit.nvim",  
		cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile"},
	},	
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	require("lspconfig").ruff_lsp.setup({
		init_options = {
			settings = {
				args = {},
			},
		},
	}),


})
