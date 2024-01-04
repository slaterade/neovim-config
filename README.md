# config-nvim
Perfection is achieved not when there is nothing more to add, but when there is nothing left to take away.

Install Neovim Configuration
```bash
git clone git@gitlab.blueorigin.com:rslater/config-nvim ~/.config/nvim
```

## plugins
- https://github.com/folke/lazy.nvim
- https://github.com/EdenEast/nightfox.nvim
- https://github.com/VonHeikemen/lsp-zero.nvim
- https://github.com/nvim-telescope/telescope.nvim
- https://github.com/mbbill/undotree
- https://github.com/tpope/vim-fugitive
- https://github.com/nvim-lualine/lualine.nvim
- https://github.com/nvim-treesitter/nvim-treesitter

# notes
## update plugins, tree sitters, language servers

```
:Lazy
:Mason
```

## build neovim from source
```bash
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install
```

## compare branches
```
git difftool <otherbranch>
```

## nvim -d <file1> <file2>

```
:h copy-diffs
```

```
]c               - advance to the next block with differences
[c               - reverse search for the previous block with differences
do (diff obtain) - bring changes from the other file to the current file
dp (diff put)    - send changes from the current file to the other file
zo               - unfold/unhide text
zc               - refold/rehide text
zr               - unfold both files completely
zm               - fold both files completely
```

visual mode put
```
:'<,'>diffput
```

## old notes

use neovim for git difftool
```bash
git config --global diff.tool nvimdiff
git config --global difftool.prompt false
```

