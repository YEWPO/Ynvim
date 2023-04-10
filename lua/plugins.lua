local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
 
local packer_bootstrap = ensure_packer()
 
require('packer').startup({function(use)
  -- Packer can manage itself 
  use 'wbthomason/packer.nvim'
 
  -- Lsp installer
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})

  use 'nvim-lua/plenary.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- DAP
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
 
  -- Completion
  use'hrsh7th/cmp-nvim-lsp'
  use'hrsh7th/cmp-buffer'
  use'hrsh7th/cmp-path'
  use'hrsh7th/cmp-cmdline'
  use'hrsh7th/nvim-cmp'
  use'L3MON4D3/LuaSnip'
  use'saadparwaiz1/cmp_luasnip'
 
  -- Troubles
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
 
  -- Terminal
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
 
  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
 
  -- File Explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
 
  -- Tree Sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use 'nvim-treesitter/nvim-treesitter-context'
 
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
 
  -- Theme and StatusLine
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'nvim-lualine/lualine.nvim'
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  -- Dashboard
  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'doom',
        config = {
          header = {
            '',            
            'YYYYYYY       YYYYYYY                                          iiii                          ',
            'Y:::::Y       Y:::::Y                                         i::::i                         ',
            'Y:::::Y       Y:::::Y                                          iiii                          ',
            'Y::::::Y     Y::::::Y                                                                        ',
            'YYY:::::Y   Y:::::YYYnnnn  nnnnnnnn vvvvvvv           vvvvvvviiiiiii    mmmmmmm    mmmmmmm   ',
            '  Y:::::Y Y:::::Y   n:::nn::::::::nnv:::::v         v:::::v i:::::i  mm:::::::m  m:::::::mm ',
            '   Y:::::Y:::::Y    n::::::::::::::nnv:::::v       v:::::v   i::::i m::::::::::mm::::::::::m',
            '    Y:::::::::Y     nn:::::::::::::::nv:::::v     v:::::v    i::::i m::::::::::::::::::::::m',
            '     Y:::::::Y        n:::::nnnn:::::n v:::::v   v:::::v     i::::i m:::::mmm::::::mmm:::::m',
            '      Y:::::Y         n::::n    n::::n  v:::::v v:::::v      i::::i m::::m   m::::m   m::::m',
            '      Y:::::Y         n::::n    n::::n   v:::::v:::::v       i::::i m::::m   m::::m   m::::m',
            '      Y:::::Y         n::::n    n::::n    v:::::::::v        i::::i m::::m   m::::m   m::::m',
            '      Y:::::Y         n::::n    n::::n     v:::::::v        i::::::im::::m   m::::m   m::::m',
            '   YYYY:::::YYYY      n::::n    n::::n      v:::::v         i::::::im::::m   m::::m   m::::m',
            '   Y:::::::::::Y      n::::n    n::::n       v:::v          i::::::im::::m   m::::m   m::::m',
            '   YYYYYYYYYYYYY      nnnnnn    nnnnnn        vvv           iiiiiiiimmmmmm   mmmmmm   mmmmmm',
            '',
            '',
            '',
            '',
            '',
            '',
          },
          center = {
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'New File',
              desc_hl = 'String',
              key = 'n',
              key_hl = 'Number',
              action = 'enew'
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Find Recent File',
              desc_hl = 'String',
              key = 'f',
              key_hl = 'Number',
              action = 'Telescope oldfiles'
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'File Explorer',
              desc_hl = 'String',
              key = 'e',
              key_hl = 'Number',
              action = 'NvimTreeOpen'
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Update Plugins',
              desc_hl = 'String',
              key = 'u',
              key_hl = 'Number',
              action = 'PackerSync'
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Configuration',
              desc_hl = 'String',
              key = 'c',
              key_hl = 'Number',
              action = 'e ~/.config/nvim/lua/config.lua'
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Exit',
              desc_hl = 'String',
              key = 'q',
              key_hl = 'Number',
              action = 'q'
            }
          }
        },
      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }

  use 'lewis6991/impatient.nvim'

  -- Which Key
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
      }
    end
  }

  -- Utils
  use 'rcarriga/nvim-notify'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}
})

require('config')
