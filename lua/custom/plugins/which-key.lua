return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    delay = 0,
    icons = {
      mappings = vim.g.have_nerd_font,
      keys = vim.g.have_nerd_font and {} or {},
    },

    spec = {
      { '<leader>s', group = 'Search' },
      { '<leader>t', group = 'Trouble' },
      { '<leader>h', group = 'Git Hunk', mode = { 'n', 'v' } },
      { '<leader>d', group = 'DotNet' },
      { '<leader>l', group = 'LSP' },
      { '<leader>y', group = 'Yazi' },
    },
  },
}
