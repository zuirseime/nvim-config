local opt = vim.opt
local g = vim.g
local o = vim.o

vim.cmd [[colorscheme everforest]]

opt.number = true
opt.relativenumber = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.cursorline = true
opt.mouse = ''
opt.smartindent = true
opt.spelllang = { 'en', 'uk' }
opt.virtualedit = 'block'
opt.wrap = false
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

g.ai_cmp = true
g.base46_cache = vim.fn.stdpath 'data' .. '/base46/'
g.have_nerd_font = false

o.cursorline = true
o.cursorlineopt = 'both'
o.showmode = false

vim.schedule(function()
  o.clipboard = 'unnamedplus'
end)

o.breakindent = true
o.undofile = true

o.ignorecase = true
o.smartcase = true

o.signcolumn = 'yes'

o.updatetime = 250

o.timeoutlen = 300

o.splitright = true
o.splitbelow = true

o.list = true

o.inccommand = 'split'

o.scrolloff = 10

o.confirm = true
