local lazy_config = require 'lazy.core.config'
local tb = require 'telescope.builtin'
local dap = require 'dap'

local map = function(keys, func, desc, mode)
  vim.keymap.set(mode or 'n', keys, func, { noremap = true, desc = desc })
end

-- Core / Editing
map(';', ':', 'CMD enter command mode')
map('jk', '<ESC>', 'Return to Normal Mode', 'i')
map('<Esc>', '<cmd>nohlsearch<CR>', 'Turn Off Highlights')
map('<C-s>', '<CMD>w<CR>', 'Save Buffer')
map('<C-c>', '<cmd>%y+<CR>', 'Copy Whole Buffer')
map('<C-q>', '<CMD>bd<CR>', 'Quit Buffer')
map('<leader>wq', '<CMD>wall<CR><CMD>qall<CR>', 'Save and Quit')
map('<A-h>', function()
  local prompt = vim.fn.input('Help', '', 'help')
  vim.cmd('vertical help ' .. prompt)
end, 'Open Helper Docs')

-- User Movement
map('<UP>', '<CMD>echo "Use \'k\' to move up"<CR>', "Use 'k' to move up", { 'n', 'i', 'x' })
map('<DOWN>', '<CMD>echo "Use \'j\' to move down"<CR>', "Use 'j' to move down", { 'n', 'i', 'x' })
map('<LEFT>', '<CMD>echo "Use \'h\' to move left"<CR>', "Use 'h' to move left", { 'n', 'i', 'x' })
map('<RIGHT>', '<CMD>echo "Use \'l\' to move right"<CR>', "Use 'l' to move right", { 'n', 'i', 'x' })

-- Indentation
map('<Tab>', '>gv', 'Indent Right', 'x')
map('<S-Tab>', '<gv', 'Indent Left', 'x')

-- Buffers
map('<Tab>', '<CMD>bnext<CR>', 'Next Buffer')
map('<S-Tab>', '<CMD>bprev<CR>', 'Previous Buffer')

-- Line / Block Movement
--- Normal Mode
map('<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", 'Move Down')
map('<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", 'Move Up')
--- Insert Mode
map('<A-j>', '<esc><cmd>m .+1<cr>==gi', 'Move Down', 'i')
map('<A-k>', '<esc><cmd>m .-2<cr>==gi', 'Move Up', 'i')
--- Visual Mode
map('<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", 'Move Down', 'v')
map('<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", 'Move Up', 'v')

-- Comments
map('gco', 'o<ESC>Vcx<ESC><CMD>normal gcc<CR>fxa<BS>', 'Add Comment Below', { 'n', 'x' })
map('gcO', 'O<ESC>Vcx<ESC><CMD>normal gcc<CR>fxa<BS>', 'Add Comment Above', { 'n', 'x' })

--- LSP: Language Service Provider
map('<leader>lrn', vim.lsp.buf.rename, 'LSP: Rename')
map('<leader>lra', vim.lsp.buf.code_action, 'LSP: Goto Code Action', { 'n', 'x' })
map('<leader>lrD', vim.lsp.buf.declaration, 'LSP: Goto Declaration')
map('<leader>lrr', tb.lsp_references, 'LSP: Goto References')
map('<leader>lri', tb.lsp_implementations, 'LSP: Goto Implementation')
map('<leader>lrd', tb.lsp_definitions, 'LSP: Goto Definition')
map('<leader>lO', tb.lsp_document_symbols, 'LSP: Open Document Symbols')
map('<leader>lW', tb.lsp_dynamic_workspace_symbols, 'LSP: Open Workspace Symbols')
map('<leader>lrt', tb.lsp_type_definitions, 'LSP: Goto Type Definition')

map('<leader>lh', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, 'LSP: Toggle Inlay Hints')
map('<leader>lc', vim.lsp.codelens.refresh, 'LSP: Refresh Codelens')

-- Formating
map('<leader>f', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, 'Format Buffer')

-- Telescope
map('<leader>sh', tb.help_tags, 'Telescope: Search Help')
map('<leader>sk', tb.keymaps, 'Telescope: Search Keymaps')
map('<leader>sf', tb.find_files, 'Telescope: Search Files')
map('<leader>ss', tb.builtin, 'Telescope: Search Select Telescope')
map('<leader>sw', tb.grep_string, 'Telescope: Search Current Word')
map('<leader>sg', tb.live_grep, 'Telescope: Search by Grep')
map('<leader>sd', tb.diagnostics, 'Telescope: Search Diagnostics')
map('<leader>sr', tb.resume, 'Telescope: Search Resume')
map('<leader>s.', tb.oldfiles, 'Telescope: Search Recent Files ("." for repeat)')
map('<leader><leader>', tb.buffers, 'Telescope: Find existing buffers')

map('<leader>/', function()
  tb.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, 'Telescope: Fuzzily search in current buffer')

map('<leader>s/', function()
  tb.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, 'Telescope: Search in Open Files')

map('<leader>sn', function()
  tb.find_files { cwd = vim.fn.stdpath 'config' }
end, 'Telescope: Search Neovim files')

-- Trouble
map('<leader>tt', '<CMD>Trouble diagnostics toggle<CR>', 'Trouble: Diagnostics')
map('<leader>tT', '<CMD>Trouble diagnostics toggle filter.buf=0<CR>', 'Trouble: Buffer Diagnostics')
map('<leader>ts', '<CMD>Trouble symbols toggle focus=false<CR>', 'Trouble: Symbols')
map('<leader>td', '<CMD>Trouble lsp toggle focus=false win.position=right<CR>', 'Trouble: LSP Definitions / References / ...')
map('<leader>tl', '<CMD>Trouble loclist toggle<CR>', 'Trouble: Location List')
map('<leader>tq', '<CMD>Trouble qflist toggle<CR>', 'Trouble: Quickfix List')

-- Widows & Layout
--- Movement
map('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
map('<C-l>', '<C-w><C-l>', 'Move focus to the right window')
map('<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
map('<C-k>', '<C-w><C-k>', 'Move focus to the upper window')
--- Resizing
map('<C-UP>', '<C-w>-', 'Resize Up')
map('<C-DOWN>', '<C-w>+', 'Resize Down')
map('<C-LEFT>', '<C-w><', 'Resize Left')
map('<C-RIGHT>', '<C-w>>', 'Resize Right')
--- Splitting
map('<A-b>', '<CMD>split<CR>', 'Open Buffer on Bottom')
map('<A-B>', '<CMD>vsplit<CR>', 'Open Buffer on Right')
map('<A-t>', '<CMD>split +term<CR>i', 'Open Terminal on Bottom')
map('<A-T>', '<CMD>vsplit +term<CR>i', 'Open Terminal on Right')

-- Terminal
map('<Esc>', '<C-\\><C-n>', 'Exit terminal mode', 't')

-- Utility
map('<F2>', '<CMD>UndotreeToggle<CR>', 'Toggle Undo Tree')

map('<leader>n', '<cmd>set nu!<CR>', 'Toggle Line Number')
map('<leader>N', '<cmd>set rnu!<CR>', 'Toggle Relative Line Number')

-- Debugging
map('<F5>', dap.continue, 'Debug: Start/Continue')
map('<F6>', dap.terminate, 'Debug: Toggle')
map('<F7>', require('dapui').toggle, 'Debug: Toggle')
map('<F10>', dap.step_over, 'Debug: Step Over')
map('<F11>', dap.step_into, 'Debug: Step Into')
map('<F12>', dap.step_out, 'Debug: Step Out')
map('<leader>b', dap.toggle_breakpoint, 'Debug: Toggle Breakpoint')
map('<leader>B', function()
  dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, 'Debug: Set Breakpoint')

-- .NET
map('<leader>dn', '<CMD>Dotnet createfile<CR>', '.NET: Create New File')
map('<leader>do', '<CMD>Dotnet testrunner<CR>', '.NET: Test Overview')
map('<leader>dt', '<CMD>Dotnet test<CR>', '.NET: Test')
map('<leader>db', '<CMD>Dotnet build<CR>', '.NET: Build')
map('<leader>dr', '<CMD>Dotnet run<CR>', '.NET: Run')

-- Yazi
map('<leader>yf', '<CMD>Yazi<CR>', 'Yazi: Open at the Current File', { 'n', 'v' })
map('<leader>yd', '<CMD>Yazi cwd<CR>', 'Yazi: Open in the Working Directory', { 'n', 'v' })
map('<leader>yt', '<CMD>Yazi toggle<CR>', 'Yazi: Toggle', { 'n', 'v' })

-- Aerial
map('{', '<CMD>AerialPrev<CR>', 'Aerial: Jump to the Previous Member')
map('}', '<CMD>AerialNext<CR>', 'Aerial: Jump to the Next Member')
map('<leader>a', '<CMD>AerialToggle!<CR>', 'Aerial: Toggle')

-- Blink
--- See lua/custom/plugins/blink.lua
--- opt.keymap

-- Misc
local plugin = lazy_config.plugins['neo-tree.nvim']
if plugin and plugin.enabled ~= false then
  map('<leader>e', '<CMD>Neotree toggle<CR>', 'Toggle Neo Tree')
end
