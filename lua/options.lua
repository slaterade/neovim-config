local opt = vim.opt

-- line numbers
opt.nu = true
opt.relativenumber = true

-- tabs and indent
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- search
opt.hlsearch = true
opt.incsearch = true

-- undo and backup
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- scroll vertical and horizontal
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.wrap = false

-- misc
opt.termguicolors = true
opt.updatetime = 50

-- cant remember why
opt.mouse = ""
