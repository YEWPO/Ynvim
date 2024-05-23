local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  "rcarriga/nvim-notify",
  "lewis6991/gitsigns.nvim",
  "stevearc/aerial.nvim",
  "github/copilot.vim",

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons", },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "nvim-treesitter/nvim-treesitter-context",

  {
    "neoclide/coc.nvim",
    branch = "release",
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },

  {
    "phaazon/hop.nvim",
    branch = "v2",
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = "nvim-lua/plenary.nvim",
  },

  "nvim-lualine/lualine.nvim",
  {
    "akinsho/bufferline.nvim",
    branch = "main",
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true
  },

  {
    "nvimdev/dashboard-nvim",
    event = 'VimEnter',
  },

  {
    "numToStr/Comment.nvim",
    lazy = false,
  },
}

local opts = {
}

require("lazy").setup(plugins, opts)

require("config/which-key")
require("config/tokyonight")
require("config/nvim-notify")
require("config/nvim-treesitter")
require("config/nvim-tree")
require("config/hop")
require("config/lualine")
require("config/bufferline")
require("config/coc")
require("config/gitsigns")
require("config/toggleterm")
require("config/telescope")
require("config/aerial")
require("config/copilot")
require("config/dashboard")
require("config/comment")
