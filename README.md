# Ynvim

`YEWPO`的`nvim`配置文件

## 效果预览

启动界面：

<img src="https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230410222854635.png" alt="image-20230410222854635" style="zoom:25%;" />

文件管理，终端，代码检查，`gitsigns`：

<img src="https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230207113218071.png" alt="image-20230207113218071" style="zoom:25%;" />

查找及预览：

<img src="https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230202181943968.png" alt="image-20230202181943968" style="zoom:25%;" />

## 配置要求

- [Neovim](https://neovim.io/) >= 0.8.0 （不建议低版本）
- [nvm](https://github.com/nvm-sh/nvm)（用于管理`nodejs`版本）
- [Nerd Font](https://www.nerdfonts.com/)（一些特殊符号LOGO的显示）
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter/) 
- [lazygit](https://github.com/jesseduffield/lazygit)（该配置中提供了对lazygit的支持）

## 文件树

```
.
├── init.vim （基本的设置，比如设置行号和缩进）
└── lua
    ├── config.lua （插件的具体配置在这个文件内，具体是什么插件的注释有分层注解）
    └── plugins.lua （添加的插件都放在了这里）
```

## 使用方法

### Linux

如果之前安装过`neovim`，请先保证彻底删除配置文件，

```shell
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

获取和安装插件：

```shell
git clone https://github.com/YEWPO/Ynvim ~/.config/nvim --depth=1 && nvim && nvim +Mason
```

**报错请忽略**。安装完成后，先退出`Packer`，再输入`:q<CR>`退出后将**自动**重新运行`nvim`，等待剩余项目安装完成。之后就可以正常使用了。

一些语言服务需要自己在`Mason`中安装。

## 插件

### 已配置

| 插件名                  | 仓库地址                                                   | 类别             |
| ----------------------- | ---------------------------------------------------------- | ---------------- |
| packer.nvim             | https://github.com/wbthomason/packer.nvim                  | 插件管理         |
| dashboard.nvim          | https://github.com/glepnir/dashboard-nvim                  | 启动界面         |
| nvim-lspconfig          | https://github.com/neovim/nvim-lspconfig                   | 语言服务         |
| null-ls                 | https://github.com/jose-elias-alvarez/null-ls.nvim         | 语言服务         |
| mason                   | https://github.com/williamboman/mason.nvim                 | 语言服务管理     |
| mason-lspconfig.nvim    | https://github.com/williamboman/mason-lspconfig.nvim       | 语言服务衔接工具 |
| trouble.nvim            | https://github.com/folke/trouble.nvim                      | 代码诊断         |
| nvim-cmp                | https://github.com/hrsh7th/nvim-cmp                        | 提示补全         |
| nvim-treesitter         | https://github.com/nvim-treesitter/nvim-treesitter         | 语法高亮         |
| Luasnip                 | https://github.com/L3MON4D3/LuaSnip                        | 片段引擎         |
| telescope.nvim          | https://github.com/nvim-telescope/telescope.nvim           | 模糊查找         |
| nvim-tree.lua           | https://github.com/kyazdani42/nvim-tree.lua                | 文件浏览器       |
| nvim                    | https://github.com/catppuccin/nvim                         | 主题             |
| lualine.nvim            | https://github.com/nvim-lualine/lualine.nvim               | 状态栏           |
| bufferline.nvim         | https://github.com/akinsho/bufferline.nvim                 | 文件栏           |
| nvim-web-devicons       | https://github.com/kyazdani42/nvim-web-devicons            | 图标             |
| toggleterm.nvim         | https://github.com/akinsho/toggleterm.nvim                 | 终端             |
| gitsigns.nvim           | https://github.com/lewis6991/gitsigns.nvim                 | git栏            |
| which-key               | https://github.com/folke/which-key.nvim                    | 快捷键           |
| comment                 | https://github.com/numToStr/Comment.nvim                   | 代码注释         |
| nvim-notify             | https://github.com/rcarriga/nvim-notify                    | 通知             |
| impatient.nvim          | https://github.com/lewis6991/impatient.nvim                | 性能优化         |
| nvim-dap                | https://github.com/mfussenegger/nvim-dap                   | 调试             |
| nvim-treesitter-context | https://github.com/nvim-treesitter/nvim-treesitter-context | 函数提示         |
| nvim-dap-ui             | https://github.com/rcarriga/nvim-dap-ui                    | 调试界面         |
| nvim-metals             | https://github.com/scalameta/nvim-metals                   | BSP              |

### 未配置

| 插件名          | 仓库地址                                   | 类别     |
| --------------- | ------------------------------------------ | -------- |
| nvim-autopairs  | https://github.com/windwp/nvim-autopairs   | 括号补全 |
| hop.nvim        | https://github.com/phaazon/hop.nvim        | 代码跳跃 |
| project.nvim    | https://github.com/ahmedkhalf/project.nvim | 项目管理 |
| tokoynight.nvim | https://github.com/folke/tokyonight.nvim   | 主题     |
| noice           | https://github.com/folke/noice.nvim        | 组件     |

## 快捷键

> `<leader>`为`<space>`。

### Normal Mode

#### 文件

| 操作         | 效果                   |
| ------------ | ---------------------- |
| `<leader>ss` | 保存文件               |
| `<leader>sq` | 保存并退出             |
| `<leader>i`  | 粘贴系统剪切板中的内容 |

#### 窗口

| 操作         | 效果           |
| ------------ | -------------- |
| `<leader>ws` | 水平分割串口   |
| `<leader>wv` | 垂直分割窗口   |
| `<leader>wh` | 跳转到左边窗口 |
| `<leader>wj` | 跳转到下边窗口 |
| `<leader>wk` | 跳转到上边窗口 |
| `<leader>wl` | 跳转到右边窗口 |
| `<leader>ww` | 跳转到最近窗口 |

#### 设置

| 操作         | 效果         |
| ------------ | ------------ |
| `<leader>Yc` | 修改配置文件 |
| `<leader>Yp` | 修改插件文件 |

#### 退出

| 操作         | 效果         |
| ------------ | ------------ |
| `<leader>qq` | 普通退出     |
| `<leader>qf` | 强制退出     |
| `<leader>qa` | 全部退出     |
| `<leader>qF` | 强制全部退出 |

#### 文件切换

| 操作         | 效果                 |
| ------------ | -------------------- |
| `<leader>bl` | 文件栏循环下一个文件 |
| `<leader>bh` | 文件栏循环上一个文件 |

#### 文件浏览器

| 操作         | 效果           |
| ------------ | -------------- |
| `<leader>eo` | 打开文件浏览器 |
| `<leader>ec` | 关闭文件浏览器 |

#### 查找

| 操作         | 效果                 |
| ------------ | -------------------- |
| `<leader>ff` | 查找文件             |
| `<leader>fr` | 查找之前打开过的文件 |

#### 终端

| 操作        | 效果                 |
| ----------- | -------------------- |
| `<leader>t` | 创建终端             |
| `<leader>g` | 创建`lazygit`终端    |
| `<esc>`     | 在终端模式下退出终端 |

#### 问题

| 操作        | 效果             |
| ----------- | ---------------- |
| `<leader>P` | 打开代码错误窗口 |

#### 插件

| 操作         | 效果     |
| ------------ | -------- |
| `<leader>ps` | 更新插件 |
| `<leader>pc` | 编译配置 |

#### 调试

| 操作          | 效果           |
| ------------- | -------------- |
| `<leader>dc`  | 运行或继续     |
| `<leader>dt`  | 设置或取消断点 |
| `<leader>de`  | 结束调试       |
| `<leader>dn`  | 下一步         |
| `<leader>di`  | 单步进入       |
| `<leader>do`  | 单步跳出       |
| `<leader>dC`  | 执行到光标处   |
| `<leader>dro` | 打开repl       |
| `<leader>drt` | 切换repl       |
| `<leader>drc` | 关闭repl       |

### Visual Mode

| 操作        | 效果                         |
| ----------- | ---------------------------- |
| `<leader>c` | 复制选中的内容到系统剪切板上 |

## 插件具体配置

见[nvim-config](http://43.139.35.156/75/nvim-config)
