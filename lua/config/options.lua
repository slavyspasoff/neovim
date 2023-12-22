local opt = vim.opt

-- ui
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 12
opt.cursorline = true
opt.showmode = false
opt.errorbells = false
opt.splitright = true
opt.splitbelow = true
opt.mouse = "a"
opt.title = false
opt.pumheight = 10
opt.updatetime = 200
opt.timeout = true
opt.timeoutlen = 0
opt.sidescrolloff = 12
opt.fileencoding = "utf-8"
opt.clipboard = "unnamedplus"
opt.completeopt = { "menuone", "noselect", "noinsert" }
opt.list = true
opt.listchars = {
  trail = "·",
}

-- editting
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false
opt.backspace = { "indent", "eol", "start" }
opt.autochdir = false
opt.spelllang = "en"
opt.spell = true
opt.hidden = true

-- search
opt.ignorecase = false
opt.smartcase = false
opt.incsearch = true
opt.hlsearch = true

-- undo and swap
opt.swapfile = false
opt.backup = false
opt.writebackup = true
opt.undofile = false
