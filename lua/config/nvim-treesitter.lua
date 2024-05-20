require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc" },
  sync_install = true,
  auto_install = false,

  highlight = {
    enable = true,
  }
}
