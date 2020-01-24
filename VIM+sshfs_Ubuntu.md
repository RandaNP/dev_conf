# Personalizzazione impostazione sorgenti
- aprire l'applicazione Software e aggiornamenti
- assicurarsi che su Software per Ubuntu siano selezionate le prime 4 voci
- su Altro softare premere su Aggiungi volume...
- procedere con l'autenticazione
- selezionare Partner di Canonical


# Pacchetti da installare
```
sudo apt install git curl build-essential file sshfs autossh neovim tmux python-pip python3-pip gnome-tweak-tool chromium-browser
```

# Installare Homebrew e aggiungerlo al path
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
```


# Impostare Chromium come browser di default
- aprire Chromium
- Impostazioni ---> Imposta come browser predefinito


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
Lanciare NeoVim e l'installazione dei plugin si avvierà in automatico
```
vim
```
Per aggiungere nuovi plugin, aggiungere il repository al file .vimrc ed eseguire (dall'interno di Vim)
```
:PlugInstall
```
Per aggiornare i plugin eseguire (dall'interno di Vim)
```
:PlugUpdate
```


# Modificare i font di gnome-terminal
- aprire il terminale
- scegliere Modifica ---> Preferenze
- sotto Profili ---> Testo scegliere Carattere personalizzato
- impostare SauceCodePro Nerd Font Mono Regular


# Impostazioni utili
- aprire l'applicazione Personalizzazioni
- sceglire nel menu a sinistra Tastiera e Mouse
- su Panoramica delle scorciatoie scegliere Opzioni aggiuntive disposizione
- su Ctrl position scegliere BlocMaiusc come Ctrl
