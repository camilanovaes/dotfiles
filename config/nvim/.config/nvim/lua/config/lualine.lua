-- lualine.nvim
-- Lualine has sections as shown below
-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+

require('lualine').setup({
  options = {
    -- theme = "vscode",
    -- theme = "nord",
    theme = "dracula",
    component_separators = {'', ''},
    section_separators = {'', ''},
  },
  sections = {
    lualine_a = {{'filename', path = 2}},
    lualine_b = {'branch', {
      'diff',
      -- color_added = 'green',
      -- color_modified = 'yellow',
      -- color_removed = 'red'
    }},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'hostname'},
    lualine_z = {'location'}
  },
})
