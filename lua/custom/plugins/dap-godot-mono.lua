return {
  'fm39hz/nvim-dap-godot-mono',
  dependencies = {
    'stevearc/overseer.nvim',
  },
  ft = 'cs',
  opts = {
    godot = {
      godot_executable = os.getenv 'GODOT' or 'godot-mono',
      netcoredbg_path = nil,
      verbose = false,
      build_cmd = { 'dotnet', 'build' },
      scan_depth = 2,
      scene_exclude_patterns = { '/addons/', '/%.godot/' },
    },
  },
}
