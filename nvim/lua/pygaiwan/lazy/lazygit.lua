return {
    
    "kdheepak/lazygit.nvim",  
	cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile"},
	
    config = function()
        vim.keymap.set('n', '<leader>lg', "<cmd>LazyGit<cr>", {desc = "LazyGit"})
    end
}
