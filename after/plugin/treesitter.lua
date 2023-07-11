require 'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
        'bash',
        'c',
        'cmake',
        'cpp',
        'css',
        'dockerfile',
        'help',
        'javascript',
        'json',
        'lua',
        'markdown',
        'python',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'yaml',
    }
}
