return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  dependencies = {
    { 'nvim-lua/plenary.nvim', lazy = true },
    {
      'nvim-neo-tree/neo-tree.nvim',
      opts = {
        filesystem = {
          hijack_netrw_behavior = 'disabled',
        },
      },
    },
  },
  ---@type YaziConfig | {}
  opts = {
    open_for_directories = false,
    change_neovim_cwd_on_close = false,
    floating_window_scaling_factor = 0.75,
    keymaps = {
      show_help = '<leader>yh',
      open_file_in_vertical_split = '<leader>yv',
      open_file_in_horizontal_split = '<leader>yx',
    },
  },
}
