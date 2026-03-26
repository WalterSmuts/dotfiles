# dotfiles

Wayland/Sway desktop configuration managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Components

- `sway` — Sway window manager (Wayland)
- `waybar` — Status bar
- `waylock` — Screen lock
- `rofi` — Application launcher
- `wofi` — Alternative Wayland launcher
- `mako` — Notification daemon
- `kanshi` — Automatic display configuration
- `nvim` — Neovim with lazy.nvim, nvim-cmp, and rust-analyzer
- `vim` — Minimal vimrc fallback
- `bash` — Shell config with vi mode and fzf
- `git` — Git aliases and pager config

## Usage

```sh
cd ~
git clone https://github.com/WalterSmuts/dotfiles.git
cd dotfiles
stow bash nvim sway waybar waylock rofi wofi mako kanshi vim git
```
