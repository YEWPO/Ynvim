require("mason").setup()
require("mason-lspconfig").setup()

vim.keymap.set("n", " m", "<cmd>Mason<cr>")
