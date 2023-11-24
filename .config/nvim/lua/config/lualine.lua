local ll = require("lualine")
local theme = require('config/theme')


ll.setup({
  options = {
    icons_enabled = true,
    theme = "everforest",
    -- theme = "auto"
    component_separators = {
      left = '',
      right = ''
    },
    section_separators = {
      left = '',
      right = ''
    },
  },
  extensions = {'fzf'},
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {'branch', icons_enabled = false},
    },
    lualine_c = {
      {
        'filename',
        path = 1
      }
    },
    lualine_x = {
      {
        'diagnostics',
        sources = {'nvim_diagnostic', 'nvim_lsp', 'ale'},
        diagnostics_color = {
          error = {fg = theme.palette.red, bg = none},
          warn  = 'DiagnosticWarn',
          info  = 'DiagnosticInfo',
          hint  = 'DiagnosticHint',
        },
      }
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
})
