vim.g.loaded_newtrw = 1
vim.g.loaded_newtrPlugin = 1
vim.opt.termguicolors = true
vim.g.mapleader = ' '
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''}) 
vim.cmd.colorscheme "tokyonight-night"
vim.notify = require("notify")

require('mason').setup()
require('mason-lspconfig').setup()
require('impatient')

-- Nvim Treesitter Setting
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "java", "python" },

  sync_install = true,

  auto_install = false,

  ignore_install = { },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    disable = { },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 3, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
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
 
local servers = { 'clangd', 'pyright', 'html' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
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
  options = {
    component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
    theme = "tokyonight",
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

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- DAP Setting
local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/yewpo/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
}
dap.defaults.fallback.terminal_win_cmd = 'ToggleTerm'
dap.configurations.cpp = {
  {
    name = "Launch GDB",
    type = "cppdbg",
    request = "launch",
    program = '${fileDirname}/${fileBasenameNoExtension}',
    args = {},
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
    externalConsole = false,
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
local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

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
    l = {"<cmd>BufferLineCloseLeft<cr>", "Close left buffers"},
    r = {"<cmd>BufferLineCloseRight<cr>", "Close right buffers"},
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
  Y = {
    name = "+Configuration",
    p = {"<cmd>e ~/.config/nvim/lua/plugins.lua<cr>", "Edit plugins.lua"},
    c = {"<cmd>e ~/.config/nvim/lua/config.lua<cr>", "Edit config.lua"},
  },
  c = {"\"+y", "Copy to Clipboard", mode = "v"},
  C = {"<cmd>%!clang-format<cr>", "ClangFormat"},
  i = {"\"+p", "Insert from Clipboard"},
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
  o = {"o<esc>k", "Create a new line below"},
  h = {
    name = "+Hop",
    w = {"<cmd>HopWord<cr>", "HopWord"},
    l = {"<cmd>HopLine<cr>", "HopLine"},
    p = {"<cmd>HopPattern<cr>", "HopPattern"},
  },
  w = {
    name = "+Windows Option",
    s = {"<cmd>split<cr>", "Horizontal Split"},
    v = {"<cmd>vsplit<cr>", "Vertical Split"},
    w = {"<c-w><c-w>", "Switch Windows"},
    l = {"<cmd>wincmd l<cr>", "Right Window"},
    h = {"<cmd>wincmd h<cr>", "Left Window"},
    k = {"<cmd>wincmd k<cr>", "Top Window"},
    j = {"<cmd>wincmd j<cr>", "Button Window"},
  }
}, {prefix = "<leader>"})

-- metals configurations
local metals_config = require("metals").bare_config()

metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
      --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}

metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()
end

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
