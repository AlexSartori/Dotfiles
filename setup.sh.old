clear
echo "Starting setup script..."
sleep 1

echo "Upgrading system..."
sleep 1
sudo dnf upgrade


read -p "Prepare GNOME look for Arc/Flat/Breeze? [Y/n] " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo -e "\e[1m========   Getting theme components...   ========\e[21m"
    source gnome-look
fi


read -p "Install DEV packages? [Y/n] " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo -e "\e[1m========    Installing DEV packages...    ========\e[21m"
cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF
    dnf -y install google-chrome-stable

    IFS=$'\n'
    packages=($(cat ./dev.packages))
    dnf -y copr enable helber/atom
    dnf -y copr enable mosquito/brackets
    dnf install ${packages[@]}
    dnf copr disable helber/atom
    dnf copr disable mosquito/brackets
fi


read -p "Source NLTK setup? [Y/n] " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo -e "\e[1m==========    Sourcing NLTK setup...    ==========\e[21m"
    source ./nltk
fi

# sudo dnf copr enable rommon/telegram
# sudo dnf install telegram-desktop

