# Ynvim

yewpo's nvim configures

**UBUNTU ONLY**

## 效果预览

文件管理，终端，代码检查

![image-20230129101126724](https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230129101126724.png)

插件管理

![image-20230129102529938](https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230129102529938.png)

补全及预览

![image-20230129102739261](https://raw.githubusercontent.com/YEWPO/yewpoblogonlinePic/main/image-20230129102739261.png)

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