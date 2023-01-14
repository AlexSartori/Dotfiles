BOLD=$(shell tput bold)
RST=$(shell tput sgr0)

.PHONY: all conf-files hosts-file fonts gimp-brushes dnf-repos dnf-software other-software snap-software finalize

all: conf-files hosts-file fonts dnf-repos dnf-software other-software gimp-brushes snap-software finalize

release := $(shell rpm -E %fedora)


conf-files:
	@echo -e "\n\n$(BOLD)### CONF-FILES$(RST)"
	cp conf/.bash{rc,_aliases,_profile} ~/
	cp conf/.vimrc ~/.vimrc
	mkdir -p ~/.vim/colors && cp conf/badwolf.vim ~/.vim/colors/
	mkdir -p ~/.config/git && cp conf/gitconfig ~/.config/git/config
	mkdir -p ~/.config/dunst && cp conf/dunstrc ~/.config/dunst/
	cp -r conf/{i3,i3lock,polybar} ~/.config/
	cp templates/* ~/Templates/
	cp -r conf/powerline ~/.config/
	cp -r conf/fish ~/.config
	cp conf/redshift.conf ~/.config/

hosts-file:
	@echo -e "\n\n$(BOLD)### HOSTS-FILE$(RST)"
	wget -q https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
	# sudo mv /etc/hosts /etc/hosts.old
	sudo mv hosts /etc/hosts
	sudo systemctl restart NetworkManager # Empty DNS cache
	sleep 5 # Wait for nm to restart

fonts:
	@echo -e "\n\n$(BOLD)### FONTS$(RST)"
	sudo cp -r fonts/* /usr/share/fonts/
	fc-cache -f -v > /dev/null # Refresh font cache

gimp-brushes:
	@echo -e "\n\n$(BOLD)### GIMP-BRUSHES$(RST)"
	cp -r gimp_brushes/* ~/.config/GIMP/2.10/brushes/

dnf-repos:
	@echo -e "\n\n$(BOLD)### DNF-REPOS$(RST)"
	sudo dnf install "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(release).noarch.rpm" "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(release).noarch.rpm"
	sudo cp repos/* /etc/yum.repos.d/

dnf-software:
	@echo -e "\n\n$(BOLD)### DNF-SOFTWARE$(RST)"
	# Let the user edit the software list and install
	@cp "dnf-software" /tmp/dnfsoft
	vi /tmp/dnfsoft
	xargs --arg-file="/tmp/dnfsoft" sudo dnf install

other-software:
	@echo -e "\n\n$(BOLD)### OTHER SOFTWARE$(RST)"
	# Let the user edit the software list and install
	@cp "other-software" /tmp/othsoft
	vi /tmp/othsoft
	sh /tmp/othsoft

snap-software:
	@echo -e "\n\n$(BOLD)### SNAP SOFTWARE$(RST)"
	# Let the user edit the software list and install
	@cp "snap-software" /tmp/snapw
	vi /tmp/snapsw
	sh /tmp/snapsw

finalize:
	@echo -e "\n\n$(BOLD)### FINALIZING$(RST)"
	@echo "Extra configuration files to copy/use can be found in: $(PWD)/extra_files"
	@echo -e "\n\n$(BOLD)### END$(RST)"

