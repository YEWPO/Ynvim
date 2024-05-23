vim.keymap.set("n", "<leader>eo", "<cmd>NvimTreeOpen<cr>")
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeClose<cr>")

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  update_focused_file = {
    enable = true,
  },
  view = {
    width = 30,
  },
  filters = {
    dotfiles = false,
  },
  git = {
    ignore = false,
  },
})
