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

function dioserver {
	base=/home/alex/Code/Unitn
	proj_name=$2

	echo "Deploying $proj_name @ $base/$proj_name..."

	if [[ $1 == "deploy" ]]; then
		# ant -f $base/$proj_name > /dev/null && \
		cp "$base/$proj_name/dist/$proj_name.war" "/home/alex/Software/apache-tomcat-8.0.27/webapps";
	fi

}
