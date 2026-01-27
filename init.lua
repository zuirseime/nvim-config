vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

local lazy_config = require 'custom.configs.lazy'

require('lazy').setup({
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'ThePrimeagen/vim-be-good' },
  { import = 'custom.plugins' },
  { import = 'custom.themes' },
}, lazy_config)

require 'custom.options'
require 'custom.autocmd'

require 'custom.configs.mason'

vim.schedule(function()
  require 'custom.mappings'
end)
