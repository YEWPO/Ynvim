vim.g.mapleader = " "

local key_mappings = {
  s = {
    name = "+Save File Options",
    s = {"<cmd>w<cr>", "Save File Only"},
    q = {"<cmd>wq<cr>", "Save and Quit"},
  },
  q = {
    name = "+Quit Options",
    q = {"<cmd>q<cr>", "Quit"},
    a = {"<cmd>qa<cr>", "Quit All"},
    f = {"<cmd>q!<cr>", "Quit Force"},
    F = {"<cmd>qa!<cr>", "Quit All Force"},
  },
  o = {"o<esc>k", "Create a new line below"},
  O = {"O<esc>k", "Create a new line above"},
  w = {
    name = "+Windows Option",
    s = {"<cmd>split<cr>", "Horizontal Split"},
    v = {"<cmd>vsplit<cr>", "Vertical Split"},
    w = {"<c-w><c-w>", "Switch Windows"},
    l = {"<cmd>wincmd l<cr>", "Right Window"},
    h = {"<cmd>wincmd h<cr>", "Left Window"},
    k = {"<cmd>wincmd k<cr>", "Top Window"},
    j = {"<cmd>wincmd j<cr>", "Button Window"},
  },
  c = {"\"+y", "Copy to Clipboard", mode = "v"},
  i = {"\"+p", "Insert from Clipboard"},
}

local opts = {
  prefix = "<leader>",
}

require("which-key").register(key_mappings, opts)
