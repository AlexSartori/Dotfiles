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
# JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.181-7.b13.fc28.x86_64/jre/lib" # "/usr/lib/jvm/jre-1.8.0-openjdk"
# export JAVA_HOME

# ANT_HOME=/usr/share/ant
# export ANT_HOME

# ANDROID_HOME=$HOME/.local/bin/
# export ANDROID_HOME

# PATH=$PATH:$JAVA_HOME/bin
# PATH=$PATH:$ANT_HOME/bin
# export PATH

export LOLCOMMITS_DEVICE=/dev/video0
export LOLCOMMITS_DELAY=1
