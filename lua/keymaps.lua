-- normal mode keymaps
vim.keymap.set("n", "<Leader>e", ":Ex<CR>")
vim.keymap.set("n", "<Leader>cd", ":cd %:p:h<CR>:pwd<CR>")
vim.keymap.set("n", "<Leader>`", ":ToggleTerm<CR>")
vim.keymap.set("n", "<Leader>t", ":ToggleTerm<CR>")
vim.keymap.set("n", "<Leader>q", ":<cmd>qa<CR>")

-- terminal mode keymaps
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

