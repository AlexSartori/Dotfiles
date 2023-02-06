# .bashrc


# Source global definitions
# -------------------------------------------------------------------
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# User specific aliases and functions
# -------------------------------------------------------------------
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

eval $(thefuck --alias)
PS1="┌ \u: \W\n└─ \$ "

PS1="┌ \u: \W\n└─ \$ "


# Powerline daemon
# -------------------------------------------------------------------
if [[ $TERM != "rxvt-unicode" && $TERM != "xterm" ]]; then
	if [ -f `which powerline-daemon` ]; then
	  powerline-daemon -q
	  POWERLINE_BASH_CONTINUATION=1
	  POWERLINE_BASH_SELECT=1
	  . /usr/share/powerline/bash/powerline.sh
	fi
fi


# Path definitions
# -------------------------------------------------------------------

export LOLCOMMITS_DEVICE=/dev/video0
export LOLCOMMITS_DELAY=1
