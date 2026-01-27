return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
      opts = {},
    },
    'folke/lazydev.nvim',
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      -- See :h blink-cmp-config-keymap for defining your own keymap
      ---@type 'default' | 'super-tab' | 'enter' | 'none'
      preset = 'enter',

      ['<TAB>'] = { 'select_next', 'snippet_forward', 'accept', 'fallback' },
      ['<S-TAB>'] = { 'select_prev', 'snippet_backward', 'accept', 'fallback' },

      ['<C-SPACE>'] = { 'show_and_insert', 'show_documentation', 'hide_documentation' },

      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
    },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
    },

    sources = {
      default = { 'lsp', 'easy-dotnet', 'path', 'snippets', 'lazydev' },
      providers = {
        lazydev = {
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
        ['easy-dotnet'] = {
          name = 'easy-dotnet',
          enabled = true,
          module = 'easy-dotnet.completion.blink',
          score_offset = 10000,
          async = true,
        },
      },
    },

    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'lua' },
    signature = { enabled = true },
  },
}
