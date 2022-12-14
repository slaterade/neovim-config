local kmap = vim.keymap.set

-- normal mode keymaps
kmap("n", "<leader>q", ":<cmd>qa<cr>")
kmap("n", "<leader>ee", ":Ex<cr>")
kmap("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>")
kmap("n", "<leader>cs", ":let @/ = \"\"<cr>") -- clear search term
kmap("n", "<leader>ts", "setlocal spell! spelllang=en_us<cr>")
kmap("n", "<leader>tt", ":ToggleTerm<cr>")
kmap("n", "<leader>tb", ":GitBlameToggle<cr>")
kmap("n", "<leader>gs", vim.cmd.Git)
kmap("n", "<c-d>", "<c-d>zz")
kmap("n", "<c-u>", "<c-u>zz")
kmap("n", "n", "nzzzv")
kmap("n", "N", "Nzzzv")
kmap("n", "J", "mzJ`z")

-- telescope
local builtin = require('telescope.builtin')
kmap('n', '<leader>ff', builtin.find_files, {})
kmap('n', '<leader>fg', builtin.live_grep, {})
kmap('n', '<leader>fb', builtin.buffers, {})
kmap('n', '<leader>fh', builtin.help_tags, {})

-- visual mode keymaps
kmap("v", "J", ":m '>+1<cr>gv=gv")
kmap("v", "K", ":m '<-2<cr>gv=gv")

-- terminal mode keymaps
kmap("t", "<esc>", "<c-\\><c-n>")

-- commands
vim.cmd(':command! W w')

