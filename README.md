### NeoVim

Install [Vim-Plug](https://github.com/junegunn/vim-plug):
```
$ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Add Config file to the nvim path:
```
$ curl https://github.com/syltr1x/dotfiles/main/nvim/init.vim -o ~/.config/nvim/init.vim 
```
See more ASCII art for banner in [ascii.nvim](https://github.com/MaximilianLloyd/ascii.nvim)

### Rofi
Download nord theme:
```
$ sudo curl -s https://raw.githubusercontent.com/undiabler/nord-rofi-theme/master/nord.rasi 
  -o /usr/share/rofi/themes/nord.rasi 
```
Apply theme in rofi config:
```
$ echo '@theme "/usr/share/rofi/themes/nord.rasi"' > ~/.config/rofi/config.rasi
```
