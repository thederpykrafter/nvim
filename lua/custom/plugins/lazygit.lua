return {
  'kdheepak/lazygit.nvim',
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Lazy [G]it' },
    { '<leader>gc', '<cmd>LazyGitFilter<cr>', desc = '[G]it Project [C]ommits' },
    { '<leader>gx', '<cmd>LazyGitConfig<cr>', desc = '[X] Lazy Git Config' },
  },
}
