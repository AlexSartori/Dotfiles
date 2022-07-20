# Set XDG variables
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_CACHE_HOME $HOME/.cache

# Activate powerline
source /usr/share/powerline/fish/powerline-setup.fish
powerline-setup

# The Fuck
thefuck --alias | source

# Print logo
set fish_greeting # Suppress default greeting
fish_logo cyan blue white

# Aliases
alias atom="atom --portable"
alias cat=lolcat
alias dusg="du -sh * | sort -hr"
# alias bat="/home/alex/Software/bat-v0.8.0-x86_64-unknown-linux-gnu/bat"
alias giacomino_scarricamelo="youtube-dl"
alias c=cd /home/alex/Code
alias dl=cd /home/alex/Downloads
alias adb="/home/alex/Software/platform-tools/adb"
alias iten="trans -s it -t en"
alias enit="trans -s en -t it"

# Paths
set -x JAVA_HOME /usr/lib/jvm/java-17-openjdk
set -x ANDROID_HOME $XDG_DATA_HOME/android
set -x ATOM_HOME $XDG_DATA_HOME/atom
set -x GEM_HOME $XDG_DATA_HOME/gem
set ARM_GCC /home/alex/Mass\ Storage/ARM-GCC/bin
set RBENV_HOME /home/alex/Software/rbenv
set RBBUILD $RBENV_HOME/plugins/ruby-build/bin
set -x RBENV_ROOT $XDG_DATA_HOME/rbenv

set -x PATH $ARM_GCC $RBENV_HOME/bin $RBBUILD $PATH

# Configure better-ls
set -x LS_COLORS (ls_colors_generator)
alias ls="ls-i --color=auto -w (tput cols)"

# Init rbenv
status --is-interactive; and rbenv init - fish | source

