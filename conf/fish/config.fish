# Activate powerline
source /usr/share/powerline/fish/powerline-setup.fish
powerline-setup

# The Fuck
thefuck --alias | source

# Print logo
set fish_greeting # Suppress default greeting
fish_logo cyan blue white

# Useful path vars
set c /home/alex/Code
set dl /home/alex/Downloads

# Aliases
alias cat=lolcat
# alias dusg="du -sh * | sort -hr"
