# Dotfiles

- **Terminal**: [Wezterm](https://github.com/wez/wezterm)
- **Terminal multiplexer**: [Tmux](https://github.com/tmux/tmux)
- **Editor**: [Neovim](https://github.com/neovim/neovim)

# Installation
Clone this repository directly in your home folder, e.g., `~/dotfiles`.

```bash
git clone https://github.com/camilanovaes/my-dotfiles.git ~/dotfiles
```

After that just run the installation script:

```bash
cd ~/dotfiles
./install.py all
```

You can check all commands before installing anything using the `--dry` flag (e.g.
`./install.py --dry all`).

# Development

For testing the `install.py` script use the docker container:
```bash
./run-dev.sh
```
