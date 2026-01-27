-- Collection of various small independent plugins/modules
local actions = {
  { name = 'Create Scratchpad', action = ':e /tmp/scratchpad', section = 'Actions' },
  { name = 'Open File', action = ':Yazi cwd', section = 'Actions' },
  { name = 'Recent Files', action = ':Telescope oldfiles', section = 'Actions' },
  { name = 'Lazy', action = ':Lazy', section = 'Actions' },
  { name = 'Quit', action = ':qa!', section = 'Actions' },
}

local headers = {
  [[
 ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
 │││├┤ │ │╰┐┌╯││││
 ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴ ]],
  [[
┏┓┏┌─┐┌─┐┳  ┳┬┌┬┐
┃┃┃├┤ │ │┗┓┏┛││││
┛┗┛└─┘└─┘ ┗┛ ┴┴ ┴]],
  [[
┏┓┏      ┳ ┳      
┃┃┃      ┃ ┃      
┃┃┃┌─┐┌─┐┃ ┃─┬─┌┬┐
┃┃┃├┤ │ │┗┳┛ │ │││
┛┗┛└─┘└─┘ ╹ ─┴─┴ ┴]],
  [[
▄ ▄      ▄ ▄      
█▙█      █ █      
█▜█┌─┐┌─┐█ █─┬─┌┬┐
█ █├┤ │ │███ │ │││
▀ ▀└─┘└─┘ ▀ ─┴─┴ ┴]],
}

local footer = function()
  local cwd = vim.loop.cwd()
  local name = vim.fn.fnamemodify(cwd, ':t')
  local path = vim.fn.fnamemodify(cwd, ':~')

  return table.concat {
    'Working Directory: ' .. name .. '\n',
    'Path: ' .. path,
  }
end

return {
  'nvim-mini/mini.nvim',
  config = function()
    math.randomseed(os.time())
    require('mini.ai').setup { n_lines = 500 }

    require('mini.tabline').setup()
    require('mini.icons').setup()
    require('mini.cursorword').setup()
    require('mini.git').setup()
    local starter = require 'mini.starter'
    starter.setup {
      autoopen = true,
      header = headers[math.random(#headers)],
      items = {
        actions,
        starter.sections.sessions(5, true),
        starter.sections.recent_files(5, false, false),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet('| ', false),
        starter.gen_hook.indexing('all', { 'Actions' }),
        starter.gen_hook.aligning('center', 'center'),
      },
      -- footer = footer,
    }
    require('mini.sessions').setup {
      autoread = true,
      autowrite = true,
      directory = vim.fn.stdpath 'data' .. '/sessions', --<"session" subdir of user data directory from |stdpath()|>,
      file = nil,
      force = { read = false, write = true, delete = false },
      hooks = {
        pre = { read = nil, write = nil, delete = nil },
        post = { read = nil, write = nil, delete = nil },
      },
      verbose = { read = false, write = true, delete = true },
    }

    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
