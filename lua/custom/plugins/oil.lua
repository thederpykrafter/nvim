return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    skip_confirm_for_simple_edits = true,
    watch_for_changes = true,
    keymaps = {
      ['q'] = 'actions.close',
      ['H'] = 'actions.toggle_hidden',
    },
  },
}
