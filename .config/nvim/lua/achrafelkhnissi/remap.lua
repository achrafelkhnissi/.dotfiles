vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", vim.cmd.w) 
vim.keymap.set("n", "<leader>q", vim.cmd.q) 
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>t", vim.cmd.terminal)

-- Remap TSPlaygroundToggle
vim.keymap.set("n", "<leader>ts", vim.cmd.TSPlaygroundToggle)
