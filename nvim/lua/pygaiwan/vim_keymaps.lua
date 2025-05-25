vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex, { desc = "Open file explorer" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move blocks highlighted up (K) or down (J)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted block up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Concatenate the below line up" })

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Save to computer clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Save selected lines to computer clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Save current line to computer clipboard" })

vim.keymap.set("n", "Q", "<nop>")

-- Resize vertical panes
vim.keymap.set("n", "<A-h>", ":vertical resize -5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-l>", ":vertical resize +5<CR>", { noremap = true, silent = true })

-- Word wrap
vim.keymap.set("n", "<A-w>", ":set wrap<CR>", { desc = "[W]ord [w]rap" })

vim.keymap.set("n", "<leader>x", "<cmd>! chmod +x %<CR>", { silent = true, desc = "Make file executable" })

vim.filetype.add({
	extension = {
		yara = "yara",
		yar = "yara",
	},
})
