# Nvim Configuration

This is my personal nvim setup built mainly for python development.

## LSP

About LSPs, this nvim setup uses mason plugin to manage the servers. Then within `/lsp` placed at the root of the config are all the extra settings for some servers that are being installed with mason. Finally within `/lua/core/` is placed `lsp.lua` file which uses the new way to setup LSPs in Nvim 0.11+.

### LSP Settings

To see what is the necessary structure of the some language server we can use:

```vim
:help lspconfig-all
```

Or also see the official lsp config for the available servers here: [lsp](https://github.com/neovim/nvim-lspconfig/tree/master/lsp)
