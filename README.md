# neovim-config
neovim config aka dotfiles

## keybinds

### language server
* `lf`: format the current buffer

* `K`: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().

* `gd`: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().

* `gl`: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
* `[d`: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
* `]d`: Move to the next diagnostic. See :help vim.diagnostic.goto_next().

## notes

```bash
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

```bash
git config --global diff.tool nvimdiff
git config --global difftool.prompt false
```

