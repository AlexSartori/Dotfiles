BOLD=$(shell tput bold)
RST=$(shell tput sgr0)

.PHONY: all conf-files hosts-file fonts gimp-brushes dnf-repos dnf-software

all: conf-files hosts-file fonts gimp-brushes dnf-repos dnf-software

conf-files:
	@echo -e "\n\n$(BOLD)### CONF-FILES$(RST)"
	cp bash/.bash{rc,_alises,_profile} ~/
	cp conf/.vimrc ~/.vimrc
	cp conf/gruvbox.vim ~/.vim/colors/
	cp conf/.gitconfig ~/.gitconfig
	cp -r conf/i3* ~/.config/
	cp templates/* ~/Templates/

hosts-file:
	@echo -e "\n\n$(BOLD)### HOSTS-FILE$(RST)"
	wget -q https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
	sudo mv /etc/host /etc/hosts.old
	sudo mv hosts /etc/hosts
	sudo systemctl restart NetworkManager # Empty DNS cache

fonts:
	@echo -e "\n\n$(BOLD)### FONTS$(RST)"
	sudo cp -r fonts/* /usr/share/fonts/
	fc-cache -f -v > /dev/null # Refresh font cache

gimp-brushes:
	@echo -e "\n\n$(BOLD)### GIMP-BRUSHES$(RST)"
	cp -r gimp_brushes/* ~/.gimp-*/brushes

dnf-repos:
	@echo -e "\n\n$(BOLD)### DNF-REPOS$(RST)"
	sudo dnf install rpmfusion-free-release rpmfusion-nonfree-release
	sudo dnf copr enable \
		mosquito/brackets\
		mosquito/atom\
		heikoada/gtk-themes\
		ribenakid/puzzles\
		cygn/pulseaudio-dlna
	sudo cp repos/* /etc/yum.repos.d/

dnf-software:
	@echo -e "\n\n$(BOLD)### DNF-SOFTWARE$(RST)"
	# Let the user edit the software list and install
	@cp "dnf-software" /tmp/dnfsoft
	vim /tmp/dnfsoft
	xargs --arg-file="/tmp/dnfsoft" sudo dnf install
	#gem install lolcat
