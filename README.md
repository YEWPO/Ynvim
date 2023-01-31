# Ynvim

yewpo's nvim configures

**DEBIAN LIKE ONLY**

## 效果预览

主题：`tokoynight`。

启动界面：

<img src="https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230129124212447.png" alt="image-20230129124212447" style="zoom: 25%;" />

文件管理，终端，代码检查：

<img src="https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230129123519451.png" alt="image-20230129123519451" style="zoom: 25%;" />

插件管理：

<img src="https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230129123740162.png" alt="image-20230129123740162" style="zoom: 25%;" />

补全及预览：

<img src="https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230129123917980.png" alt="image-20230129123917980" style="zoom: 25%;" />

按键提示：

<img src="https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230129123957283.png" alt="image-20230129123957283" style="zoom:25%;" />

## 使用方法

### Debian Like

```shell
git clone https://github.com/YEWPO/Ynvim ~/.config/nvim && nvim +PackerSync
```

## 插件

### 已配置

| 插件名               | 仓库地址                                             | 类别             |
| -------------------- | ---------------------------------------------------- | ---------------- |
| packer.nvim          | https://github.com/wbthomason/packer.nvim            | 插件管理         |
| dashboard.nvim       | https://github.com/glepnir/dashboard-nvim            | 启动界面         |
| nvim-lspconfig       | https://github.com/neovim/nvim-lspconfig             | 语言服务         |
| null-ls              | https://github.com/jose-elias-alvarez/null-ls.nvim   | 语言服务         |
| mason                | https://github.com/williamboman/mason.nvim           | 语言服务管理     |
| mason-lspconfig.nvim | https://github.com/williamboman/mason-lspconfig.nvim | 语言服务衔接工具 |
| trouble.nvim         | https://github.com/folke/trouble.nvim                | 代码诊断         |
| nvim-cmp             | https://github.com/hrsh7th/nvim-cmp                  | 提示补全         |
| nvim-treesitter      | https://github.com/nvim-treesitter/nvim-treesitter   | 语法高亮         |
| Luasnip              | https://github.com/L3MON4D3/LuaSnip                  | 片段引擎         |
| telescope.nvim       | https://github.com/nvim-telescope/telescope.nvim     | 模糊查找         |
| nvim-tree.lua        | https://github.com/kyazdani42/nvim-tree.lua          | 文件浏览器       |
| tokoynight.nvim      | https://github.com/folke/tokyonight.nvim             | 主题             |
| nvim                 | https://github.com/catppuccin/nvim                   | 主题             |
| lualine.nvim         | https://github.com/nvim-lualine/lualine.nvim         | 状态栏           |
| bufferline.nvim      | https://github.com/akinsho/bufferline.nvim           | 文件栏           |
| nvim-web-devicons    | https://github.com/kyazdani42/nvim-web-devicons      | 图标             |
| toggleterm.nvim      | https://github.com/akinsho/toggleterm.nvim           | 终端             |
| gitsigns.nvim        | https://github.com/lewis6991/gitsigns.nvim           | git栏            |
| which-key            | https://github.com/folke/which-key.nvim              | 快捷键           |
| comment              | https://github.com/numToStr/Comment.nvim             | 代码注释         |
| nvim-notify          | https://github.com/rcarriga/nvim-notify              | 通知             |

### 未配置

| 插件名         | 仓库地址                                 | 类别     |
| -------------- | ---------------------------------------- | -------- |
| nvim-autopairs | https://github.com/windwp/nvim-autopairs | 括号补全 |
| hop.nvim       | https://github.com/phaazon/hop.nvim      | 代码跳跃 |
| nvim-dap       | https://github.com/mfussenegger/nvim-dap | 调试     |
| nvim-dap-ui    | https://github.com/rcarriga/nvim-dap-ui  | 调试界面 |

## 快捷键

> <leader>为`\`。

### Normal Mode

#### 文件

| 操作         | 效果       |
| ------------ | ---------- |
| `<leader>ss` | 保存文件   |
| `<leader>sq` | 保存并退出 |
| `<leader>q`  | 普通退出   |

#### 文件浏览器

| 操作         | 效果           |
| ------------ | -------------- |
| `<leader>eo` | 打开文件浏览器 |
| `<leader>ec` | 关闭文件浏览器 |

#### 终端

| 操作        | 效果     |
| ----------- | -------- |
| `<leader>t` | 创建终端 |

### File Explorer

| 操作 | 效果     |
| ---- | -------- |
| `u`  | 上级目录 |