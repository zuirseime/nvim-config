-- Collection of various small independent plugins/modules
return {
  'nvim-mini/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }

    require('mini.tabline').setup()
    require('mini.icons').setup()
    require('mini.cursorword').setup()
    require('mini.git').setup()
    require('mini.sessions').setup {
      autoread = true,
      autowrite = true,
      directory = '', --<"session" subdir of user data directory from |stdpath()|>,
      file = 'Session.vim',
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
