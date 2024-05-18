local headers = {
  {
    '                                               ',
    '                                               ',
    '┏┳┓┓┏┏┓┳┓┏┓┳┓┏┓┓┏┓┏┓┳┓┏┓┏┓┏┳┓┏┓┳┓  ┳┓┏┓┏┓┓┏┳┳┳┓',
    ' ┃ ┣┫┣ ┃┃┣ ┣┫┃┃┗┫┃┫ ┣┫┣┫┣  ┃ ┣ ┣┫  ┃┃┣ ┃┃┃┃┃┃┃┃',
    ' ┻ ┛┗┗┛┻┛┗┛┛┗┣┛┗┛┛┗┛┛┗┛┗┻  ┻ ┗┛┛┗  ┛┗┗┛┗┛┗┛┻┛ ┗',
    '                                               ',
    '                                               ',
  },
  {
    '                                             ',
    '                                             ',
    '                                             ',
    '                                             ',
    '┌┬┐┬ ┬┌─┐┌┬┐┌─┐┬─┐┌─┐┬ ┬┬┌─┬─┐┌─┐┌─┐┌┬┐┌─┐┬─┐',
    ' │ ├─┤├┤  ││├┤ ├┬┘├─┘└┬┘├┴┐├┬┘├─┤├┤  │ ├┤ ├┬┘',
    ' ┴ ┴ ┴└─┘─┴┘└─┘┴└─┴   ┴ ┴ ┴┴└─┴ ┴└   ┴ └─┘┴└─',
    '                                             ',
    '                                             ',
  },
  {
    '                                  ',
    '    ███     ████████▄     ▄█   ▄█▄',
    '▀█████████▄ ███   ▀███   ███ ▄███▀',
    '   ▀███▀▀██ ███    ███   ███▐██▀  ',
    '    ███   ▀ ███    ███  ▄█████▀   ',
    '    ███     ███    ███ ▀▀█████▄   ',
    '    ███     ███    ███   ███▐██▄  ',
    '    ███     ███   ▄███   ███ ▀███▄',
    '   ▄████▀   ████████▀    ███   ▀█▀',
    '                         ▀        ',
    '                                  ',
  },
  {
    '         E#Wi        G:             L.                                                ',
    '         E###G.      E#,    :       EW:        ,ft            t                       ',
    'GEEEEEEELE#fD#W;     E#t  .GE       E##;       t#E            Ej            ..       :',
    ',;;L#K;;.E#t t##L    E#t j#K;       E###t      t#E t      .DD E#,          ,W,     .Et',
    '   t#E   E#t  .E#K,  E#GK#f         E#fE#f     t#E EK:   ,WK. E#t         t##,    ,W#t',
    '   t#E   E#t    j##f E##D.          E#t D#G    t#E E#t  i#D   E#t        L###,   j###t',
    '   t#E   E#t    :E#K:E##Wi          E#t  f#E.  t#E E#t j#f    E#t      .E#j##,  G#fE#t',
    '   t#E   E#t   t##L  E#jL#D:        E#t   t#K: t#E E#tL#i     E#t     ;WW; ##,:K#i E#t',
    '   t#E   E#t .D#W;   E#t ,K#j       E#t    ;#W,t#E E#WW,      E#t    j#E.  ##f#W,  E#t',
    '   t#E   E#tiW#G.    E#t   jD       E#t     :K#D#E E#K:       E#t  .D#L    ###K:   E#t',
    '   t#E   E#K##i      j#t            E#t      .E##E ED.        E#t :K#t     ##D.    E#t',
    '    fE   E##D.                                 G#E t          E#t          #G      E#t',
  },
  {
    '                                                              ',
    '                                                              ',
    '████████╗██████╗ ██╗  ██╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗',
    '╚══██╔══╝██╔══██╗██║ ██╔╝    ████╗  ██║██║   ██║██║████╗ ████║',
    '   ██║   ██║  ██║█████╔╝     ██╔██╗ ██║██║   ██║██║██╔████╔██║',
    '   ██║   ██║  ██║██╔═██╗     ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║',
    '   ██║   ██████╔╝██║  ██╗    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║',
    '   ╚═╝   ╚═════╝ ╚═╝  ╚═╝    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',
    '                                                              ',
  },
  {
    '                                                                                     ',
    'sdSS_SSSSSSbs   .S_sSSs     .S    S.          .S_sSSs     .S    S.    .S   .S_SsS_S. ',
    'YSSS~S%SSSSSP  .SS~YS%%b   .SS    SS.        .SS~YS%%b   .SS    SS.  .SS  .SS~S*S~SS.',
    '     S%S       S%S   `S%b  S%S    S&S        S%S   `S%b  S%S    S%S  S%S  S%S `Y` S%S',
    '     S%S       S%S    S%S  S%S    d*S        S%S    S%S  S%S    S%S  S%S  S%S     S%S',
    '     S&S       S%S    S&S  S&S   .S*S        S%S    S&S  S&S    S%S  S&S  S%S     S%S',
    '     S&S       S&S    S&S  S&S_sdSSS         S&S    S&S  S&S    S&S  S&S  S&S     S&S',
    '     S&S       S&S    S&S  S&S~YSSY%b        S&S    S&S  S&S    S&S  S&S  S&S     S&S',
    '     S&S       S&S    S&S  S&S    `S%        S&S    S&S  S&S    S&S  S&S  S&S     S&S',
    '     S*S       S*S    d*S  S*S     S%        S*S    S*S  S*b    S*S  S*S  S*S     S*S',
    '     S*S       S*S   .S*S  S*S     S&        S*S    S*S  S*S.   S*S  S*S  S*S     S*S',
    '     S*S       S*S_sdSSS   S*S     S&        S*S    S*S   SSSbs_S*S  S*S  S*S     S*S',
    '     S*S       SSS~YSSY    S*S     SS        S*S    SSS    YSSP~SSS  S*S  SSS     S*S',
    '     SP                    SP                SP                      SP           SP ',
    '     Y                     Y                 Y                       Y            Y  ',
    '                                                                                     ',
  },
  {
    '                                                                ',
    '                                                                ',
    '######## ########  ##    ##    ##    ## ##     ## #### ##     ##',
    '   ##    ##     ## ##   ##     ###   ## ##     ##  ##  ###   ###',
    '   ##    ##     ## ##  ##      ####  ## ##     ##  ##  #### ####',
    '   ##    ##     ## #####       ## ## ## ##     ##  ##  ## ### ##',
    '   ##    ##     ## ##  ##      ##  ####  ##   ##   ##  ##     ##',
    '   ##    ##     ## ##   ##     ##   ###   ## ##    ##  ##     ##',
    '   ##    ########  ##    ##    ##    ##    ###    #### ##     ##',
    '                                                                ',
    '                                                                ',
  },
  {
    '                                                                ',
    '888        888 888                             d8b              ',
    '888        888 888                             Y8P              ',
    '888        888 888                                              ',
    '888888 .d88888 888  888      88888b.  888  888 888 88888b.d88b. ',
    '888   d88" 888 888 .88P      888 "88b 888  888 888 888 "888 "88b',
    '888   888  888 888888K       888  888 Y88  88P 888 888  888  888',
    'Y88b. Y88b 888 888 "88b      888  888  Y8bd8P  888 888  888  888',
    ' "Y888 "Y88888 888  888      888  888   Y88P   888 888  888  888',
    '                                                                ',
  },
}

return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        vim.keymap.set('n', '<leader>;', '<cmd>Dashboard<CR>', { desc = '[;]Dashboard' }),
        theme = 'doom',
        config = {
          vim.cmd 'hi DashboardHeader guifg=#7781da',
          vim.cmd 'hi DashboardIcon guifg=#0D5C63',
          vim.cmd 'hi DashboardDesc guifg=#D7D9CE',
          vim.cmd 'hi DashboardKey guifg=#ff8700',
          vim.cmd 'hi DashboardFooter guifg=#00FFCD',
          header = headers[1], -- change header here
          center = {
            {
              icon = '  ',
              desc = 'Recent Files',
              key = 'r',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'Telescope oldfiles',
            },
            {
              icon = '󱈅  ',
              desc = 'Find Files in Workspace',
              key = 'f',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'Telescope find_files',
            },
            {
              icon = '  ',
              desc = 'Find Text in Workspace',
              key = 't',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'Telescope live_grep',
            },
            {
              icon = '󱘢  ',
              desc = 'Find Git Files in Workspace   ',
              key = 'g',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'Telescope git_files',
            },
            {
              icon = '󰒲  ',
              desc = 'Lazy Package Manager',
              key = 'l',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'Lazy',
            },
            {
              icon = '  ',
              desc = 'Notes',
              key = 'n',
              key_format = ' %s', -- remove default surrounding `[]`
              -- action = "lua require'telescope.builtin'.find_files({})",
              action = 'Telescope find_files no_ignore=true cwd=C:/Users/thede/Dropbox/Apps/remotely-save/Notes',
            },
            {
              icon = '  ',
              desc = 'NeoVim Config',
              key = 'c',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'Telescope find_files cwd=C:/Users/thede/AppData/Local/nvim',
            },
            {
              icon = '░  ',
              desc = 'Toggle Transparency',
              key = 'T',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'TransparentToggle',
            },
            {
              icon = '󰩈  ',
              desc = 'Quit NeoVim',
              key = 'q',
              key_format = ' %s',
              action = 'qa',
            },
          },
          footer = function()
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return {
              '',
              '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms',
            }
          end, --your footer
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}
