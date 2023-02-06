# .bash_aliases


# Aliases
# -------------------------------------------------------------------

alias ..="cd .."
alias ~="cd ~"
alias dl="cd /home/alex/Downloads"
alias code="cd /home/alex/Code"

alias cat=lolcat

alias dir_usage="du -sh * |sort -hr"

alias py3=python3
alias py2=python2

# Functions
# -------------------------------------------------------------------

function md {
    mkdir -p $1
	cd $1
}

