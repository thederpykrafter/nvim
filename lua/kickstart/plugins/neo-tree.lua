-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    filesystem = {
      window = {
        width = 28,
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      filtered_items = {
        hide_by_name = {
          'node_modules',
        },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      --use_libuv_file_watcher = true,
    }, -- end filesystem
    source_selector = {
      winbar = true,
      statusline = false,
    },
  },
}
