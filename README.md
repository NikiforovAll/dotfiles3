# Arch Dotfiles

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/NikiforovAll/dotfiles3
```

## Extras

Based on: <https://itsfoss.com/arch-linux-windows-subsystem/>, <https://wiki.archlinux.org/title/Install_Arch_Linux_on_WSL>
Once logged in as root from wsl user:

```bash
pacman -S nano
pacman -Qs sudo
useradd -m nall
passwd nall
usermod -aG wheel nall
EDITOR=nano visudo

```