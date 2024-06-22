## Hyprland
Dependence ([yay](https://aur.archlinux.org/yay-git.git)):
```
sudo git clone https://aur.archlinux.org/yay-git.git/ /opt/
cd /opt/yay-git
sudo makepkg -si
```
Install [Hyprland](https://github.com/soldoestech/hyprland):
```
sudo git clone https://github.com/soldoestech/hyprland.git
cd /opt/hyprland
chmod +x set-hypr
./set-hypr
```
## Qtile
#### ❗ See how to install Qtile in your distro [here](https://docs.qtile.org/en/latest/manual/install/index.html)
Apply Qtile config:
```
curl -s https://raw.githubusercontent.com/syltr1x/dotfiles/qtile/config.py -o ~/.config/qtile/config.py
```
## Kitty
#### See how to install kitty in your distro [here](https://sw.kovidgoyal.net/kitty/binary/):
```
curl -s https://raw.githubusercontent.com/syltr1x/dotfiles/main/kitty/kitty.conf ~/.config/kitty/kitty.conf
```
## NeoVim
❗ You need latest version of nvim (not installed in majority of distros)

Install latest NeoVim Version [here](https://github.com/neovim/neovim/releases)

Install [Vim-Plug](https://github.com/junegunn/vim-plug):
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Add Config file to the nvim path:
```
curl -s https://raw.githubusercontent.com/syltr1x/dotfiles/main/nvim/init.vim -o ~/.config/nvim/init.vim 
```
Install Plugins:
```
:PlugInstall
```
❗ See more ASCII art for banner in [ascii.nvim](https://github.com/MaximilianLloyd/ascii.nvim)
## Rofi
Download [nord](https://github.com/undiabler/nord-rofi-theme) theme:
```
sudo curl -s https://raw.githubusercontent.com/undiabler/nord-rofi-theme/master/nord.rasi \
  -o /usr/share/rofi/themes/nord.rasi 
```
Apply theme in rofi config:
```
echo '@theme "/usr/share/rofi/themes/nord.rasi"' > ~/.config/rofi/config.rasi
```
## WayBar
Copy config to waybar path:
```
git clone https://github.com/syltr1x/dotfiles
cd dotfiles
mv waybar ~/.config/
```
❗ Don't forgot read the config.jsonc, scripts/get_ip.sh scripts/htb_ip.sh to configure network interface and other values.
## Terminal Config (zsh)
#### Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh):
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
#### Install [powerlevel10k](https://github.com/romkatv/powerlevel10k):
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```
#### Install oh-my-zsh plugins:
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
#### Aliasses:
```
curl -s https://raw.githubusercontent.com/syltr1x/dotfiles/main.zshalias -o ~/.zshalias
```
