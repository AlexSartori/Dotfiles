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
alias dusg="du -sh * | sort -hr"
alias bat="/home/alex/Software/bat-v0.8.0-x86_64-unknown-linux-gnu/bat"
alias giacomino_scarricamelo="youtube-dl"
