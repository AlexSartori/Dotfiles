echo "[*] Copying ~/.bashrc & ~/.bash_aliases & ~/.bash_profile..."
cp bash/.bash{rc,_alises,_profile} ~/

echo "[*] Copying ~/.vimrc..."
cp conf/.vimrc ~/.vimrc

echo "[*] Copying ~/.gitconfig..."
cp conf/.gitconfig ~/.gitconfig

echo "[*] Installing fonts to /usr/share/fonts/..."
sudo cp -r fonts/* /usr/share/fonts/
echo "    Refreshing font cache..."
fc-cache -f -v > /dev/null
