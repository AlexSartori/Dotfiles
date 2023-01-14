# Set XDG variables
set -x -g XDG_DATA_HOME $HOME/.local/share
set -x -g XDG_CONFIG_HOME $HOME/.config
set -x -g XDG_STATE_HOME $HOME/.local/state
set -x -g XDG_CACHE_HOME $HOME/.cache

# Activate powerline
source /usr/share/powerline/fish/powerline-setup.fish
powerline-setup

# The Fuck
thefuck --alias | source

# Print logo
set fish_greeting # Suppress default greeting
fish_logo cyan blue white

# Aliases
alias cat=lolcat
alias dusg="du -sh * | sort -hr"
# alias bat="/home/alex/Software/bat-v0.8.0-x86_64-unknown-linux-gnu/bat"
alias giacomino_scarricamelo="youtube-dl"
alias c=cd /home/alex/Code
alias dl=cd /home/alex/Downloads
alias adb="/home/alex/Software/platform-tools/adb"
alias iten="trans -s it -t en"
alias enit="trans -s en -t it"

# Hacky alias for atom because bugs
function atom
	/usr/bin/atom $argv --portable
end

# Paths
set -x -g JAVA_HOME /usr/lib/jvm/java-18-openjdk
set -x -g ANDROID_HOME $XDG_DATA_HOME/android

# Remove clutter from home
set -x -g ATOM_HOME $XDG_DATA_HOME/atom
set -x -g GEM_HOME $XDG_DATA_HOME/gem
set -x -g GNUPGHOME $XDG_DATA_HOME/gnupg
set -x -g GRADLE_USER_HOME $XDG_DATA_HOME/gradle
set -x -g GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -x -g JUPYTER_CONFIG_DIR $XDG_CONFIG_HOME/jupyter
set -x -g WINEPREFIX $XDG_DATA_HOME/wine32
set -x -g RBENV_ROOT $XDG_DATA_HOME/rbenv
set -x -g LESSHISTFILE=$XDG_STATE_HOME/less/history

set RBENV_HOME /home/alex/Software/rbenv
set RBBUILD $RBENV_HOME/plugins/ruby-build/bin
set -x PATH $RBENV_HOME/bin $RBBUILD $PATH

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

# Configure better-ls
set -x -g LS_COLORS (ls_colors_generator)
alias ls="ls-i --color=auto -w (tput cols)"

# Init rbenv
status --is-interactive; and rbenv init - fish | source

