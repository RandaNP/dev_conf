# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

#export TERM="xterm-color"
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '

#alias nvim
alias vim='nvim'

# Source .bashrc if present
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
export PATH="~/Library/Python/3.7/bin:/usr/local/opt/node@12/bin:/usr/local/sbin:$PATH"
