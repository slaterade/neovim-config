vim.keymap.set("n", "<Leader>e", ":Ex<CR>")
vim.keymap.set("n", "<Leader>cd", ":cd %:p:h<CR>:pwd<CR>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- terminal mode escape to normal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

