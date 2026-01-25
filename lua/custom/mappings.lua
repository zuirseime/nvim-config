local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { noremap = true, desc = desc })
end

map(';', ':', 'CMD enter command mode')
map('jk', '<ESC>', 'Return to Normal Mode', 'i')

map('grn', vim.lsp.buf.rename, 'LSP: [R]e[n]ame')
map('gra', vim.lsp.buf.code_action, 'LSP: [G]oto Code [A]ction', { 'n', 'x' })
map('grr', require('telescope.builtin').lsp_references, 'LSP: [G]oto [R]eferences')
map('gri', require('telescope.builtin').lsp_implementations, 'LSP: [G]oto [I]mplementation')
map('grd', require('telescope.builtin').lsp_definitions, 'LSP: [G]oto [D]efinition')
map('grD', vim.lsp.buf.declaration, 'LSP: [G]oto [D]eclaration')
map('gO', require('telescope.builtin').lsp_document_symbols, 'LSP: Open Document Symbols')
map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'LSP: Open Workspace Symbols')
map('grt', require('telescope.builtin').lsp_type_definitions, 'LSP: [G]oto [T]ype Definition')

map('\\', '<CMD>Neotree toggle<CR>', 'Toggle Neo Tree')

map('<leader>f', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, '[F]ormat Buffer')

map('<Tab>', '>gv', 'Move intendation up', 'x')
map('<S-Tab>', '<gv', 'Move intendation down', 'x')

map('<Tab>', '<CMD>bnext<CR>', 'Next Buffer')
map('<S-Tab>', '<CMD>bprev<CR>', 'Previous Buffer')

map('<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", 'Move Down')
map('<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", 'Move Up')
map('<A-j>', '<esc><cmd>m .+1<cr>==gi', 'Move Down', 'i')
map('<A-k>', '<esc><cmd>m .-2<cr>==gi', 'Move Up', 'i')
map('<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", 'Move Down', 'v')
map('<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", 'Move Up', 'v')

map('gco', 'o<ESC>Vcx<ESC><CMD>normal gcc<CR>fxa<BS>', 'Add Comment Below', { 'n', 'x' })
map('gcO', 'O<ESC>Vcx<ESC><CMD>normal gcc<CR>fxa<BS>', 'Add Comment Above', { 'n', 'x' })

map('<UP>', '<NOP>', "Use 'k' to move up", { 'n', 'i', 'x' })
map('<DOWN>', '<NOP>', "Use 'j' to move down", { 'n', 'i', 'x' })
map('<LEFT>', '<NOP>', "Use 'h' to move left", { 'n', 'i', 'x' })
map('<RIGHT>', '<NOP>', "Use 'l' to move right", { 'n', 'i', 'x' })

map('<leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, '[T]oggle Inlay [H]ints')

map('<C-s>', '<CMD>w<CR>', '[S]ave Buffer')
map('<C-x>', '<CMD>bd<CR>', 'Close Buffer')

map('<Esc>', '<cmd>nohlsearch<CR>', 'Turn Off Highlights')

map('<leader>q', vim.diagnostic.setloclist, '[Q]uickfix List')

map('<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode', 't')

map('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
map('<C-l>', '<C-w><C-l>', 'Move focus to the right window')
map('<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
map('<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

map('<F2>', '<CMD>UndotreeToggle<CR>', 'Toggle Undo Tree')

map('<C-UP>', '<C-w>-', 'Resize Up')
map('<C-DOWN>', '<C-w>+', 'Resize Down')
map('<C-LEFT>', '<C-w><', 'Resize Left')
map('<C-RIGHT>', '<C-w>>', 'Resize Right')

local builtin = require 'telescope.builtin'
map('<leader>sh', builtin.help_tags, '[S]earch [H]elp')
map('<leader>sk', builtin.keymaps, '[S]earch [K]eymaps')
map('<leader>sf', builtin.find_files, '[S]earch [F]iles')
map('<leader>ss', builtin.builtin, '[S]earch [S]elect Telescope')
map('<leader>sw', builtin.grep_string, '[S]earch current [W]ord')
map('<leader>sg', builtin.live_grep, '[S]earch by [G]rep')
map('<leader>sd', builtin.diagnostics, '[S]earch [D]iagnostics')
map('<leader>sr', builtin.resume, '[S]earch [R]esume')
map('<leader>s.', builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')
map('<leader><leader>', builtin.buffers, '[ ] Find existing buffers')

map('<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, '[/] Fuzzily search in current buffer')

map('<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, '[S]earch [/] in Open Files')

map('<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, '[S]earch [N]eovim files')

local dap = require 'dap'
map('<leader>b', function()
  dap.toggle_breakpoint()
end, 'Debug: Toggle Breakpoint')
map('<leader>B', function()
  dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, 'Debug: Set Breakpoint')
