return {
  'stevearc/aerial.nvim',
  opts = {},
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('aerial').setup {
      layout = {
        max_width = { 80, 0.2 },
        width = 50,
        min_width = 20,

        ---@type 'prefer_right' | 'prefer_left' | 'right' | 'left' | 'float'
        default_direction = 'right',
        placement = 'edge',
      },
      highlight_mode = 'full_width',
    }
  end,
}
