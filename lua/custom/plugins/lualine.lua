return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = false,
      theme = 'rose-pine',
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_a = {
        { 'mode', right_padding = 2 },
      },
      lualine_b = { { 'filename', path = 1 } },
      lualine_c = {},
      -- lualine_c = {
      --   { require('NeoComposer.ui').status_recording },
      --
      lualine_x = {},
      lualine_y = { 'branch', 'progress' },
      lualine_z = {
        { 'location', left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
  },
}
