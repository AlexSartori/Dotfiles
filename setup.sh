clear
echo "Starting setup script..."
echo

read -p "Source NLTK setup? [Y/n] " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo -e "\e[1m==========    Sourcing NLTK setup...    ==========\e[21m"
    source nltk
fi

