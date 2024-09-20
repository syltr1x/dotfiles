local function get_colored_diagnostics()
  local diagnostics = {}
  local error_count = #vim.diagnostic.get(0, {severity = vim.diagnostic.severity.ERROR})
  local warning_count = #vim.diagnostic.get(0, {severity = vim.diagnostic.severity.WARN})
  local hint_count = #vim.diagnostic.get(0, {severity = vim.diagnostic.severity.HINT})

  if error_count > 0 then
    table.insert(diagnostics, string.format("%s %d", "%#LspDiagnosticsError#", error_count))
  end
  if warning_count > 0 then
    table.insert(diagnostics, string.format("%s󱈸 %d", "%#LspDiagnosticsWarning#", warning_count))
  end
  if hint_count > 0 then
    table.insert(diagnostics, string.format("%s %d", "%#LspDiagnosticsHint#", hint_count))
  end

  return table.concat(diagnostics, ' ')
end

-- Define highlight groups
vim.cmd([[highlight LspDiagnosticsError guifg=#ec5f67 guibg=#403c3a]])
vim.cmd([[highlight LspDiagnosticsWarning guifg=#ECBE7B guibg=#403c3a]])
vim.cmd([[highlight LspDiagnosticsHint guifg=#548abf guibg=#403c3a]])

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox', -- Bar theme, see more in https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
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
        symbols = {added = '󱇬 ', modified = '󰏫 ', removed = '󱘹 '},
        source = nil,
      },
      get_colored_diagnostics,
    },
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
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
