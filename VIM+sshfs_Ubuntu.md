# Pacchetti da installare
```
sudo apt install git sshfs autossh neovim tmux python-pip python3-pip
```


# Powerline Fonts
```
git clone https://github.com/powerline/fonts.git --depth=1 fonts
./fonts/install.sh
rm -rf fonts/
```


# Abilitazione vimrc su NeoVim
```
mkdir -p .config/nvim
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" > .config/nvim/init.vim
echo "let &packpath = &runtimepath" >> .config/nvim/init.vim
echo "source ~/.vimrc" >> .config/nvim/init.vim
```


# Copiare gli rc files
```
mv vimrc ~/.vimrc
mv tmux.conf ~/.tmux.conf
```


# Installazione plugin
Lanciare NeoVim e installare i plugin
```
vim
:PlugInstall
```
