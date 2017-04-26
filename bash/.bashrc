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


# Powerline daemon
# -------------------------------------------------------------------
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi


# Path definitions
# -------------------------------------------------------------------
JAVA_HOME=/usr/java/latest
export JAVA_HOME

PATH=$PATH:$JAVA_HOME/bin
PATH=$PATH:~/Android/Sdk/tools
PATH=$PATH:~/Android/Sdk/platform-tools
export PATH

