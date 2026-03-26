# dotfiles

Wayland/Sway desktop configuration managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Components

- `sway` — Window manager with vim-style navigation
- `waybar` — Status bar (workspaces, network, battery, clock)
- `rofi` — Application launcher and clipboard picker
- `mako` — Notification daemon (Catppuccin theme)
- `kanshi` — Automatic display profile switching
- `nvim` — Neovim with lazy.nvim, nvim-cmp, and rust-analyzer
- `vim` — Minimal vimrc fallback
- `bash` — Shell config with vi mode, fzf, and exit code prompt
- `git` — Aliases and pager config

## Install (new machine)

```sh
cd ~
git clone https://github.com/WalterSmuts/dotfiles.git
cd dotfiles
stow bash nvim sway waybar rofi mako kanshi vim git
```

## Install (existing configs)

`stow --adopt` replaces existing files with symlinks, pulling their
content into the repo. Restore the repo versions afterwards:

```sh
cd ~/dotfiles
stow --adopt -t ~ bash nvim sway waybar rofi mako kanshi vim git
git checkout -- .
```

## Machine-specific config

Portable config lives in this repo. Machine-specific settings go in
untracked `.local` files that are sourced automatically:

- `~/.bashrc.local` — Work tooling, extra PATHs, aliases
- `~/.gitconfig.local` — User name and email
