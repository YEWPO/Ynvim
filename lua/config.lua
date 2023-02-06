require('mason').setup()
require('mason-lspconfig').setup()
require('impatient')

-- Nvim Treesitter Setting
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "c", "cpp", "lua", "vim", "help", "java", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
 
-- Completion Setting
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
 
local luasnip = require("luasnip")
local cmp = require'cmp'
 
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-z>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})
 
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
 
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
 
local capabilities = require('cmp_nvim_lsp').default_capabilities()
 
local lspconfig = require('lspconfig')
 
local servers = { 'clangd', 'jdtls', 'pyright' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
 
-- NvimTree Setting
require('nvim-tree').setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  git = {
    ignore = false;
  },
})
 
-- Status Line Setting
require('lualine').setup {
  sections = {
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      },
      'encoding', 'fileformat', 'filetype'
    },
  },
  options = {
    component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
    theme = "catppuccin",
    disabled_filetypes = {
      statusline = {'NvimTree', 'toggleterm', 'dap-repl'},
      winbar = {},
    },
    ignore_focus = {
      'NvimTree',
      'toggleterm',
      'dap-repl',
    },
  }
}
require('bufferline').setup {
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
  options = {
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
  }
}
 
-- Null-ls Setting
local null_ls = require("null-ls")
 
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.completion.luasnip,
  },
})

-- Terminal Setting
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
})

function _lazygit_toggle()
  lazygit:toggle()
end

-- Noice Setting
require("noice").setup({
  cmdline = {
    view = "cmdline",
  },
})

-- DAP Setting
local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/yewpo/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
}
dap.defaults.fallback.external_terminal = {
  command = '/home/yewpo/.local/bin/kitty',
  args = {},
}
dap.configurations.cpp = {
  {
    name = "Launch GDB",
    type = "cppdbg",
    request = "launch",
    program = '${fileDirname}/${fileBasenameNoExtension}',
    args = {},
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
    externalConsole = true,
    MIMode = "gdb",
    miDebuggerPath = '/usr/bin/gdb',
    setupCommands = {  
      { 
         text = '-enable-pretty-printing',
         description =  'enable pretty printing',
         ignoreFailures = false 
      },
    },
  },
}
dap.configurations.c = dap.configurations.cpp

-- Which key mappings
local wk = require("which-key")

wk.register ({
  e = {
    name = "+File Explorer",
    o = {"<cmd>NvimTreeOpen<cr>", "Open File Explorer"},
    c = {"<cmd>NvimTreeClose<cr>", "Close File Explorer"}
  },
  t = {"<cmd>ToggleTerm<cr>", "Create a new Terminal"},
  s = {
    name = "+Save File options",
    s = {"<cmd>w<cr>", "Save File Only"},
    q = {"<cmd>wq<cr>", "Save and Quit"},
  },
  f = {
    name = "+Find",
    f = {"<cmd>Telescope find_files<cr>", "Find File"},
    r = {"<cmd>Telescope oldfiles<cr>", "Find Recent File"},
  },
  q = {
    name = "+Quit Options",
    q = {"<cmd>q<cr>", "Quit"},
    a = {"<cmd>qa<cr>", "Quit All"},
    f = {"<cmd>q!<cr>", "Quit Force"},
    F = {"<cmd>qa!<cr>", "Quit All Force"},
  },
  P = {"<cmd>Trouble<cr>", "Problem Line"},
  g = {"<cmd>lua _lazygit_toggle()<cr>", "Lazygit"},
  d = {"<cmd>Dashboard<cr>", "Dashboard"},
  p = {
    name = "+Packer",
    s = {"<cmd>PackerSync<cr>", "PackerSync"},
    c = {"<cmd>PackerCompile<cr>", "PackerCompile"},
  },
  b = {
    name = "+Bufferline",
    l = {"<cmd>BufferLineCycleNext<cr>", "Next Buffer"},
    h = {"<cmd>BufferLineCyclePrev<cr>", "Prev Buffer"},
  },
  c = {"<cmd>e ~/.config/nvim/lua/config.lua<cr>", "Configuration"},
  m = {"<cmd>Mason<cr>", "Mason"},
  d = {
    name = "+Debug",
    e = {"<cmd>lua require('dap').terminate()<cr>", "End"},
    t = {"<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint"},
    C = {"<cmd>lua require('dap').run_to_cursor()<cr>", "Move to Cursor"},
    c = {"<cmd>lua require('dap').continue()<cr>", "Continue"},
    n = {"<cmd>lua require('dap').step_over()<cr>", "Step Over"},
    i = {"<cmd>lua require('dap').step_into()<cr>", "Step Into"},
    o = {"<cmd>lua require('dap').step_out()<cr>", "Step Out"},
    r = {
      name = "+Repl",
      o = {"<cmd>lua require('dap').repl.open()<cr>", "Repl Open"},
      t = {"<cmd>lua require('dap').repl.toggle()<cr>", "Repl Toggle"},
      c = {"<cmd>lua require('dap').repl.close()<cr>", "Reql Close"},
    },
  },
}, {prefix = "<leader>"})
