-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- To debug vim mapping overlaps
-- :verbose nmap <command>
-- :verbose imap <command>
-- :verbose vmap <command>
-- :verbose noremap <command>

vim.g.mapleader = " "

local options = { noremap = true, silent = true }

-- Normal --
-- avoid yank with x
vim.keymap.set("n", "x", "'_x")

-- remap the yank dedicated register
-- to paste from yank register and not from the unnamed one
vim.keymap.set("n", "<M-p>", '"0p')

-- increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- redef C-j to C-g
vim.keymap.set("n", "<C-g>", "<Plug>IMAP_JumpForward", options)

-- new tab
vim.keymap.set("n", "te", ":tabedit<Return>")

-- navigate tabs
vim.keymap.set("n", "tl", ":tabnext<Return>")
vim.keymap.set("n", "th", ":tabNext<Return>")

-- navigate windows
vim.keymap.set("n", "<C-k>", "<CMD>wincmd k<CR>", options)
vim.keymap.set("n", "<C-j>", "<CMD>wincmd j<CR>", options)
vim.keymap.set("n", "<C-h>", "<CMD>wincmd h<CR>", options)
vim.keymap.set("n", "<C-l>", "<CMD>wincmd l<CR>", options)

-- resize window
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", options)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", options)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", options)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", options)

-- split window
vim.keymap.set("n", "<Leader>wh", "<CMD>split<CR>", options)
vim.keymap.set("n", "<Leader>wv", "<CMD>vsplit<CR>", options)

-- save and quite
vim.keymap.set("n", "<Leader>fs", "<CMD>w<CR>", options)
vim.keymap.set("n", "<Leader>q", "<CMD>q<CR>", options)
vim.keymap.set("n", "<Leader>qq", "<CMD>q!<CR>", options)

-- reload config
vim.keymap.set("n", "<Leader>rr", "<CMD>luafile %<CR>", options)

-- deselect matching string after search
vim.keymap.set("n", "<Leader>.", "<CMD>noh<CR>", options)

-- replace all instances selected with shift + *
vim.keymap.set("n", "<Leader>z", ":%s///g<Left><Left>", options)

-- open file explorer in the current dir
vim.keymap.set("n", "<Leader>f.", "<CMD>!open .<CR>", options)

-- format JSON into human readable form
vim.keymap.set("n", "fo", ":%!python -m json.tool", options)

-- record/execute macros
vim.keymap.set("n", "Q", "q", options)
vim.keymap.set("n", "q", "@", options)

-- Visual --
-- stay in indent mode
vim.keymap.set("v", "<", "<gv", options)
vim.keymap.set("v", ">", ">gv", options)

-- Visual Block --
-- replace all instances that are ONLY inside of visually selected range
vim.keymap.set("x", "<Leader>z", ":s///g<Left><Left>", options)

-- Terminal --
-- return to normal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n><CR>", options)
