return {
  '3rd/image.nvim',
  event = 'VeryLazy',
  dependencies = {
    'kiyoon/magick.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    backend = 'kitty',
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        filetypes = {
          'markdown',
          'vimwiki',
        },
      },
    },
    tmux_show_only_in_active_window = false,
    kitty_method = 'normal',
    hijack_file_patterns = { '*.svg', '*.png', '*.jpg', '*.jpeg', '*.gif', '*.bmp', '*.ico', '*.webp' },
  },
}
