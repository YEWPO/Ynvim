# Ynvim

yewpo's nvim configures

**DEBIAN LIKE ONLY**

## 效果预览

主题：`tokoynight`。

启动界面：

![image-20230129124212447](https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230129124212447.png)

文件管理，终端，代码检查：

![image-20230129123519451](https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230129123519451.png)

插件管理：

![image-20230129123740162](https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230129123740162.png)

补全及预览：

![image-20230129123917980](https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230129123917980.png)

按键提示：

![image-20230129123957283](https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230129123957283.png)

## 使用方法

进入`~/.config`目录，然后下载源码

```shell
git clone https://github.com/YEWPO/Ynvim.git
```

将下载的文件夹名更换为`nvim`

```shell
mv Ynvim ./nvim
```

**编辑`~/.config/nvim/lua/plugins.lua`，找到并注释掉`vim.cmd[[colorscheme tokyonight-night]]`这一行。**

运行`nvim`，在内部命令行输入`PackerSync<CR>`。（`<CR>`表示回车）；或者，终端运行`nvim +PackerSync`，**运行后中途报错忽略**。完成后，退出`nvim`，解除上文中注释的内容，再次运行`nvim`，即可完成配置。

## 已有插件

### 插件管理

- packer.nvim

### 启动界面

- dashboard.nvim

### 语言服务

- lspconfig
- null-ls
- mason
- mason-lspconfig

### 补全工具

- nvim-cmp
- luasnip
- cmp-buffer
- cmp-path
- cmp-cmdline
- cmp-luasnip

### 查找工具

- telescope.nvim

### 终端工具

- toggleterm.nvim

### 文件管理

- nvimtree

### 状态烂

- lualine
- bufferline

### 注释工具

- comment.nvim

### 通知工具

- nvim-notify

### 快捷键

- which-key.nvim

## 自定义快捷键

- `<bs>eo`：打开文件浏览器
- `<bs>ec`：关闭文件浏览器
- `<bs>t`：新建一个终端