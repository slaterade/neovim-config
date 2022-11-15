-- normal mode keymaps
vim.keymap.set("n", "<leader>e", ":Ex<cr>")
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>")
vim.keymap.set("n", "<leader>`", ":ToggleTerm<cr>")
vim.keymap.set("n", "<leader>t", ":ToggleTerm<cr>")
vim.keymap.set("n", "<leader>q", ":<cmd>qa<cr>")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- terminal mode keymaps
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")

