# .bash_aliases


# Aliases
# -------------------------------------------------------------------

alias ..="cd .."
alias ~="cd ~"
alias dl="cd /home/alex/Downloads"
alias code="cd /home/alex/Code"

alias serve="python -m SimpleHTTPServer 8080"
alias work="cd ~/Code/TCMReports"

alias processing=/home/alex/.local/share/processing-3.2.1/processing


# Functions
# -------------------------------------------------------------------

function md {
    mkdir -p $1
	cd $1
}

function git {
	if [ "$1" == "init" ]; then
		/usr/bin/git init;
		read -p "Create remote repo [y/n]? ";
		if [[ "$REPLY" =~ ^[Yy]$ ]]; then
			name=${PWD##*/};
			read -p "Repository name (ENTER to use <$name>): ";
			if [ "$REPLY" ]; then
				name=$REPLY;
			fi;
			echo "Connecting to xiao ($name)...";
			ssh xiao@192.168.1.200 mkrepo "$name";
			echo "> git remote add xiao \"xiao@192.168.1.200:/home/xiao/repos/$name\"";
			/usr/bin/git remote add xiao "xiao@192.168.1.200:/home/xiao/repos/$name";
		fi;
	else
		/usr/bin/git "$@";
	fi;
}

