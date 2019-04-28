# Vim configuration

## Vundle
Using vundle as extension manager

### Instalation
```bash  
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

```

### Vimrc
Copy the .vimrc from this rep to your home directory: 
```bash  
cp .vimrc ~/.vimrc

```

### Downdload and install all the plugins 
Open vim and type:  
```bash  
:PluginInstall

```

## Ctags
### Instalation
Install Exuberant ctags

```bash 
sudo apt install exuberant-ctags
```

### Usage
Generate ctag file

```bash 
ctags -R project-folder
```
