require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc" },
  sync_install = true,
  auto_install = false,

  highlight = {
    enable = true,
  }
}

require("treesitter-context").setup {
  enable = true,
  max_lines = 0, -- No limit on the number of lines
  trim_scope = "outer", -- Show context from outer scopes
  min_window_height = 0, -- No minimum window height
}
