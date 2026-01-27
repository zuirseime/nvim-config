local opt = vim.opt
local g = vim.g

vim.cmd [[colorscheme everforest]]

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = 'both'
opt.showmode = false
opt.signcolumn = 'yes'
opt.scrolloff = 10
opt.confirm = true

-- Indentation
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true

-- Text Rendering
opt.wrap = false
opt.virtualedit = 'block'
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = 'split'

-- Splits & Windows
opt.splitright = true
opt.splitbelow = true

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Files
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Input
opt.mouse = ''
opt.backspace = { 'indent', 'eol', 'start' }
opt.formatoptions = 'rjqn'

-- Completion & Command-Line
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.pumheight = 10

opt.shortmess = 'aoOsTACF'
opt.cmdheight = 0

-- Spellchecking
opt.spelllang = { 'en', 'uk' }

-- Filetype & Encoding Sefety
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- Globals
g.ai_cmp = true
g.base46_cache = vim.fn.stdpath 'data' .. '/base46/'
g.have_nerd_font = false

-- Misc
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)
