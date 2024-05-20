# Ynvim

YEWPO's neovim configuration.

## 1 Prepare

❗ You should have your [neovim](https://neovim.io/) (version >= 0.9.0) installed on your computer.

📌 Recommend [nvm](https://github.com/nvm-sh/nvm) to manage your `nodejs` and `npm` version.

📌 Recommend [Nerd Font](https://www.nerdfonts.com/) installed on your computer for a better emoji showing up.

📌 Recommend [lazygit](https://github.com/jesseduffield/lazygit) installed on your computer for your code's version control.

**Clean up your previous neovim cache.**

```shell
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

## 2 Install

Install following software on your computer.

```shell
# Ubuntu example:
sudo apt install fzf fd-find ripgrep xclip tree-sitter-cli python3.$(python3 --version | cut -d ' ' -f2 | cut -d '.' -f2)-venv
```

Then, install the `Ynvim`.

```shell
git clone https://github.com/YEWPO/Ynvim ~/.config/nvim --depth=1
```

Great,  you can use `Ynvim` by command `nvim`. 🎉

