return {
  'neoclide/coc.nvim',
  branch = 'release',
  config = function()
    local keymap = vim.keymap.set

    keymap('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', { desc = 'coc next' })
    keymap('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], { desc = 'coc previous' })
    keymap('i', '<cr>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { desc = 'coc accept' })
  end,
}
