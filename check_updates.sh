BOLD=$(tput bold)
RST=$(tput sgr0)

associations="
    ./conf/fish/config.fish;$HOME/.config/fish/config.fish
    ./conf/fish/functions/fish_logo.fish;$HOME/.config/fish/functions/fish_logo.fish
    ./conf/fish/functions/md.fish;$HOME/.config/fish/functions/md.fish
    ./conf/fish/functions/wtr.fish;$HOME/.config/fish/functions/wtr.fish
    ./conf/i3/config;$HOME/.config/i3/config
    ./conf/polybar/config;$HOME/.config/polybar/config
    ./conf/polybar/launch.sh;$HOME/.config/polybar/launch.sh
    ./conf/polybar/modules.ini;$HOME/.config/polybar/modules.ini
    ./conf/polybar/modules-secondary.ini;$HOME/.config/polybar/modules-secondary.ini
    ./conf/polybar/custom_modules/get_spotify_status.sh;$HOME/.config/polybar/custom_modules/get_spotify_status.sh
    ./conf/polybar/custom_modules/polybar-kdeconnect.sh;$HOME/.config/polybar/custom_modules/polybar-kdeconnect.sh
    ./conf/polybar/custom_modules/scroll_spotify_status.sh;$HOME/.config/polybar/custom_modules/scroll_spotify_status.sh
    ./conf/polybar/custom_modules/polybar-lmsensors_linux_amd64;$HOME/.config/polybar/custom_modules/polybar-lmsensors_linux_amd64
    ./conf/powerline/themes/shell/custom.json;$HOME/.config/powerline/themes/shell/custom.json
    ./conf/powerline/config.json;$HOME/.config/powerline/config.json
    ./conf/.bash_aliases;$HOME/.bash_aliases
    ./conf/.bashrc;$HOME/.bashrc
    ./conf/.vimrc;$HOME/.vim/vimrc
    ./conf/badwolf.vim;$HOME/.vim/colors/badwolf.vim
    ./conf/dunstrc;$HOME/.config/dunst/dunstrc
    ./conf/gitconfig;$HOME/.config/git/config
    ./conf/redshift.conf;$HOME/.config/redshift.conf
"

echo "This script will check for diffs between the files in this repo and the ones currently in use by the system."

for x in $associations; do
    IFS=";" read -r file_repo file_sys <<< $x
    echo -e "\nComparing:"
    echo "    Repo file   ->  $BOLD$file_repo$RST"
    echo "    System file ->  $BOLD$file_sys$RST"

    while true; do
        diff $file_sys $file_repo > /dev/null
        diff_rc=$?
        case "$diff_rc" in
            0) echo "    -> Files are equal, continuing";;
            1) echo "    -> Files differ";;
            *) echo "    -> Diff error";;
        esac

        if [ $diff_rc == 0 ]; then
            break
        fi
        

        echo -n "    [u]pdate repo / view [d]iff / edit with [m]eld / [i]gnore: "
        read ans
        
        case "$ans" in
            'u')
                echo "    Updating"
                cp $file_sys $file_repo
                cont=false
            ;;
            'd') diff -y --color='always' $file_repo $file_sys | less -R ;;
            'm') meld $file_repo $file_sys ;;
            'i')
                echo "    Skipping"
                break;
            ;;
            *) echo "Enzomma";;
        esac
    done

done
