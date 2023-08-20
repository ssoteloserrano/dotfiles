-- local status_ok, _ = pcall(require, "vimtex")
-- if not status_ok then
--   return
-- end

-- if vim.fn.exists(':Vimtex') == 1 then
--     -- The Vimtex plugin is installed and available
--     vim.cmd('let g:vimtex_view_method = "zathura"')
--     -- Other configuration options...
-- else
--     -- The Vimtex plugin is not installed
--     print("Vimtex plugin is not installed")
-- end

-- This is necessary for VimTeX to load properly.
vim.cmd('filetype plugin indent on')

-- This enables Vim's and Neovim's syntax-related features.
vim.cmd('syntax enable')

-- Viewer options: One may configure the viewer either by specifying a built-in viewer method.
vim.g.vimtex_view_method = 'zathura'

-- Or with a generic interface:
vim.g.vimtex_view_general_viewer = 'okular'
-- vim.g.vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

-- VimTeX uses latexmk as the default compiler backend.
-- If you want another compiler backend, you can change it as follows.
vim.g.vimtex_compiler_method = 'latexmk'

-- Most VimTeX mappings rely on localleader and this can be changed with the following line.
-- The default is usually fine and is the symbol "\".
vim.g.maplocalleader = ','
