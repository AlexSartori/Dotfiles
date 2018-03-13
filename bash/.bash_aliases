# .bash_aliases


# Aliases
# -------------------------------------------------------------------

alias ..="cd .."
alias ~="cd ~"
alias dl="cd /home/alex/Downloads"
alias code="cd /home/alex/Code"

alias serve="python -m SimpleHTTPServer 8080"
alias cat=lolcat

alias dir_usage="du -sh * |sort -hr"

# Functions
# -------------------------------------------------------------------

function md {
    mkdir -p $1
	cd $1
}

