require 'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  indent = { enable = true },
  ensure_installed = {
    'bash',
    'c',
    'cmake',
    'cpp',
    'dockerfile',
    'javascript',
    'json',
    'lua',
    'python',
    'toml',
    'typescript',
    'yaml',
  }
}
