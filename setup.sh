echo "[*] Copying ~/.bashrc & ~/.bash_aliases & ~/.bash_profile..."
cp bash/.bash{rc,_alises,_profile} ~/

echo "[*] Copying ~/.vimrc..."
cp conf/.vimrc ~/.vimrc

echo "[*] Copying vim colorscheme..."
cp conf/gruvbox.vim ~/.vim/colors/

echo "[*] Copying ~/.gitconfig..."
cp conf/.gitconfig ~/.gitconfig

echo "[*] Copying i3 configuration..."
cp -R conf/i3* ~/.config/

echo "[*] Installing fonts to /usr/share/fonts/..."
sudo cp -r fonts/* /usr/share/fonts/
echo "    Refreshing font cache..."
fc-cache -f -v > /dev/null

