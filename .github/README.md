# Dotfiles
- **OS**:
- **Terminal**: [Alacritty](https://github.com/jwilm/alacritty)
- **Editor**: [neovim](https://github.com/neovim/neovim)

# Installation
## How to clone and config this repository
> Ref: https://www.atlassian.com/git/tutorials/dotfiles

Use the following command to clone the repository:

```bash
git clone --bare https://github.com/camilanovaes/my-dotfiles $HOME/.cfg
```

And set the `showUntrackedFiles` to `no` to hide files we are not explicity tracking yet.

```bash
config config --local status.showUntrackedFiles no
```

Create a alias on `.zshrc` file, named `config`, so that we can use to interact with our configuration repository, instead of the regular `git` command.

```bash
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
```

# Some configs..
## ZSH
ZSH is one of the most feature-rich shells for Unix.

### Installation
On ubuntu/debian run:

```
sudo apt install zsh
```

### Oh-My-Zsh
Oh-My-Zsh is a framework to manage Zsh configuration. It has plugins and themes for ZSH.
To install just run:

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### Plugins
#### ZSH-autosuggestions
Provides auto completion for shell commands
To install just run the following command:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### ZSH-syntax-hightlighting
Provides syntax hightlighting on the shell
To install just run:

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### FZF
Provides fuzzy search
To install just run:

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Git
### Pretty git log
Add the following to `$HOME/.gitconfig`:
```
[alias]
   l = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
```

### Use watch with color support on git commands
To use color in `git status` when being run by `watch`, you need to run the following command:

```
git config --global color.status always
```

After, you can run:

```
watch --color git status
```
