local function get_lsp_diagnostics()
  local error_count = vim.lsp.diagnostic.get_count(0, "Error")
  local warning_count = vim.lsp.diagnostic.get_count(0, "Warning")

  return string.format("E:%d W:%d", error_count, warning_count)
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox', -- Cambia a tu tema preferido
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      {
        'diff',
        colored = true,
        diff_color = {
          added    = { fg = '#98be65' },
          modified = { fg = '#ECBE7B' },
          removed  = { fg = '#ec5f67' },
        },
        symbols = {added = ' ', modified = '柳 ', removed = ' '},
        source = nil,
      }
    },
    lualine_c = {'filename'},
    lualine_x = {get_lsp_diagnostics, 'encoding', 'fileformat', 'filetype'},
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
  extensions = {}
}
