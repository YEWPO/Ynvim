require("lualine").setup {
  options = {
    component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
    theme = "tokyonight",
    disabled_filetypes = {
      statusline = {'NvimTree', 'toggleterm'},
      winbar = {},
    },
    ignore_focus = {
      'NvimTree',
      'toggleterm',
    },
  },
}
