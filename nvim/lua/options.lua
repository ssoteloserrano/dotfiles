local g            = vim.g
local opt          = vim.opt

-- leader
g.mapleader        = " "

-- colors
opt.termguicolors  = true

-- encoding
opt.encoding       = "utf-8"
opt.fileencoding   = "utf-8"
opt.fileencodings  = "utf-8,ucs-bom,gb18030,gbk,gb2312,cp936"

-- default position
opt.scrolloff      = 5

-- ex line
opt.ls             = 0
opt.ch             = 0

-- gutter
opt.number         = true
opt.numberwidth    = 2
opt.signcolumn     = "yes:2"
opt.relativenumber = true

-- search
opt.incsearch      = true
opt.ignorecase     = true
opt.smartcase      = true

-- indent
opt.tabstop        = 4
opt.softtabstop    = 2
opt.shiftwidth     = 2
opt.expandtab      = true
opt.autoindent     = true
opt.smartindent    = true
opt.smarttab       = true

-- mouse, clipboard
opt.mouse          = "a"
opt.clipboard      = "unnamedplus"

-- backup
opt.swapfile       = false
opt.undofile       = true
opt.backup         = false
opt.writebackup    = false
opt.undodir        = os.getenv("HOME") .. "/.local/state/nvim/undo"

-- wrapping
opt.wrap           = true
opt.hidden         = true
opt.cursorline     = true

-- splits
opt.inccommand     = "nosplit"
opt.splitbelow     = true
opt.splitright     = true

-- line symbols
opt.list           = true
opt.listchars      = { space = "⋅", tab = "| ", eol = "↴" }

-- folding
opt.foldmethod     = "indent"
opt.foldenable     = false

-- misc
opt.updatetime     = 50
opt.pumheight      = 10
opt.completeopt    = "menuone,noinsert,noselect"

opt.cmdheight = 1
