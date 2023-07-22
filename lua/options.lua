-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs and indent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- undo and backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true

-- scroll vertical and horizontal
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

-- misc
--vim.opt.shell = "zsh"
vim.opt.termguicolors = true
vim.opt.updatetime = 50

-- cant remember why
vim.opt.mouse = ""
