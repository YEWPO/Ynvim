require("bufferline").setup {
    options = {
    indicator = {
      style = 'underline',
    },
    separator_style = 'slant',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        text_align = 'center',
        separator = true
      }
    },
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = false,
    numbers = 'ordinal'
  },
}

vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "<leader>ql", "<cmd>BufferLineCloseLeft<cr>")
vim.keymap.set("n", "<leader>qr", "<cmd>BufferLineCloseRight<cr>")
