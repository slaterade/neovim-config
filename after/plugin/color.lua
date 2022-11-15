require("tokyonight").setup({
    -- use the right style (storm, moon, night, or day)
    style = "night",

    -- background
    transparent = true,

    -- disable italic for functions
    styles = {
        functions = {}
    }

})

vim.cmd[[colorscheme tokyonight]]

