# neovim-config
neovim config aka dotfiles

## keybinds

### language server
- `gl`: show diagnostics in a floating window
- `[d`: move to the previous diagnostic in the current buffer
- `]d`: move to the next diagnostic in the current buffer
- `lf`: format the current buffer

## notes

```bash
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

```bash
git config --global diff.tool nvimdiff
git config --global difftool.prompt false
```

