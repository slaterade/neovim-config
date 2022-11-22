-- normal mode keymaps
vim.keymap.set("n", "<leader>q", ":<cmd>qa<cr>")
vim.keymap.set("n", "<leader>ee", ":Ex<cr>")
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>")
vim.keymap.set("n", "<leader>ts", "setlocal spell! spelllang=en_us<cr>")
vim.keymap.set("n", "<leader>tt", ":ToggleTerm<cr>")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- terminal mode keymaps
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")

