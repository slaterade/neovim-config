-- normal mode keymaps
ks = vim.keymap.set

ks("n", "<leader>q", ":<cmd>qa<cr>")
ks("n", "<leader>ee", ":Ex")
ks("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>")
ks("n", "<leader>cs", ":let @/ = \"\"<cr>") -- clear search term
ks("n", "<leader>ts", "setlocal spell! spelllang=en_us<cr>")
ks("n", "<leader>tt", ":ToggleTerm<cr>")
ks("n", "<leader>tb", ":GitBlameToggle<cr>")
ks("n", "<c-d>", "<c-d>zz")
ks("n", "<c-u>", "<c-u>zz")
ks("n", "n", "nzz")
ks("n", "N", "Nzz")

-- telescope
local builtin = require('telescope.builtin')
ks('n', '<leader>ff', builtin.find_files, {})
ks('n', '<leader>fg', builtin.live_grep, {})
ks('n', '<leader>fb', builtin.buffers, {})
ks('n', '<leader>fh', builtin.help_tags, {})

-- terminal mode keymaps
ks("t", "<esc>", "<c-\\><c-n>")

-- commands
vim.cmd(':command! W w')

