vim.g.mapleader = " "

local key_mappings = {
  { "<leader>s", group = "Save"},
  { "<leader>ss", "<cmd>w<cr>", desc = "Save File Only"},
  { "<leader>sq", "<cmd>wq<cr>", desc = "Save and Quit"},
  { "<leader>q", group = "Quit"},
  { "<leader>qq", "<cmd>q<cr>", desc = "Quit"},
  { "<leader>qa", "<cmd>qa<cr>", desc = "Quit All"},
  { "<leader>qf", "<cmd>q!<cr>", desc = "Quit Force"},
  { "<leader>qF", "<cmd>qa!<cr>", desc = "Quit All Force"},
  { "<leader>o", "o<esc>k", desc = "Create a new line below"},
  { "<leader>O", "O<esc>j", desc = "Create a new line above"},
  { "<leader>w", group = "Windows"},
  { "<leader>ws", "<cmd>split<cr>", desc = "Horizontal Split"},
  { "<leader>wv", "<cmd>vsplit<cr>", desc = "Vertical Split"},
  { "<leader>ww", "<c-w><c-w>", desc = "Switch Windows"},
  { "<leader>wl", "<cmd>wincmd l<cr>", desc = "Right Window"},
  { "<leader>wh", "<cmd>wincmd h<cr>", desc = "Left Window"},
  { "<leader>wk", "<cmd>wincmd k<cr>", desc = "Top Window"},
  { "<leader>wj", "<cmd>wincmd j<cr>", desc = "Button Window"},
  { "<leader>c", "\"+y", desc = "Copy to Clipboard", mode = "v"},
  { "<leader>i", "\"+p", desc = "Insert from Clipboard"},
  { "<leader>P", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)"},
}

require("which-key").add(key_mappings)
