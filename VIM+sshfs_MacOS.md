Installare FUSE for OSX e SSHFS

Installare Homebrew e autossh:
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install autossh

Preparazione ambiente VIM e SSH:
- (se non si è ancora accettata la licenza Xcode):
sudo xcodebuild -license

brew install python
brew install mercurial
brew install vim —-env-std —-override-system-vim
(se ci son problemi di compilazione provare:
brew update
brew doctor —> seguire le indicazioni
l’ultima volta era /usr/local/sbin non presente nel path:
	echo 'export PATH="/usr/local/sbin:$PATH"' >> ~/.bash_profile
)

Ripristino configurazioni:
Dropbox/dev_conf/randaDevTools -r

Lanciare VIM e installare i plugin (probabilmente non serve installare dopo il ripristino):
vim
:BundleInstall
