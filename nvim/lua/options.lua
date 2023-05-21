local g = vim.g
local opt = vim.opt

g.mapleader = " "

opt.encoding      = "utf-8"
opt.fileencoding  = "utf-8"
opt.fileencodings = "utf-8,ucs-bom,gb18030,gbk,gb2312,cp936"

opt.mouse = "a"
opt.wrap = true
opt.hidden = true
opt.number = true
opt.scrolloff = 9
opt.numberwidth = 2
opt.signcolumn = "yes:1"
opt.termguicolors = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.cursorline= true

opt.updatetime = 300

opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"
opt.pumheight = 10
opt.completeopt = "menuone,noinsert,noselect"
opt.swapfile = false
opt.undofile = true
opt.backup = false
opt.writebackup = false
opt.list = true
opt.listchars = { space = "⋅", tab = "| ", eol = "↴" }

vim.cmd [[autocmd FileType javascript setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType html setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType css setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType lua setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4]]
vim.cmd [[autocmd FileType php setlocal expandtab shiftwidth=2 softtabstop=2]]

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})

