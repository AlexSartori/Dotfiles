echo "[*] Copying ~/.bashrc & ~/.bash_aliases & ~/.bash_profile..."
cp bash/.bash{rc,_alises,_profile} ~/

echo "[*] Copying ~/.vimrc..."
cp conf/.vimrc ~/.vimrc

echo "[*] Copying vim colorscheme..."
cp conf/gruvbox.vim ~/.vim/colors/

echo "[*] Copying ~/.gitconfig..."
cp conf/.gitconfig ~/.gitconfig

echo "[*] Copying i3 & i3lock configuration..."
cp -r conf/i3* ~/.config/

echo "[*] Copying file templates in ~/Templates..."
cp templates/* ~/Templates/

echo "[*] Getting StevenBlack's hosts file..."
wget -q https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
sudo mv /etc/host /etc/hosts.old
sudo mv hosts /etc/hosts
sudo systemctl restart NetworkManager # Empty DNS cache

echo "[*] Installing fonts to /usr/share/fonts/..."
sudo cp -r fonts/* /usr/share/fonts/
echo "    Refreshing font cache..."
fc-cache -f -v > /dev/null

echo "[*] Copying GIMP brushes..."
cp -r gimp_brushes/* ~/.gimp-*/brushes

echo "[*] Enabling RPM Fusion repos..."
sudo dnf install rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
echo "[*] Enabling copr repos... 
	mosquito/brackets 
	mosquito/atom 
	heikoada/gtk-themes"
sudo dnf copr enable mosquito/brackets mosquito/atom heikoada/gtk-themes
echo "[*] Enabling last repos... (chrome, skype, megasync, insync, intellinuxgraphics)"
sudo cp repos/* /etc/yum.repos.d/

echo "[*] Installing lolcat..."
gem install lolcat
