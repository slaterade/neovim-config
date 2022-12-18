require('nightfox').setup({
  options = {
    transparent = true, -- Disable setting background
    dim_inactive = true, -- Non focused panes set to alternative background
  }
})

-- setup must be called before loading
vim.cmd("colorscheme nightfox")
