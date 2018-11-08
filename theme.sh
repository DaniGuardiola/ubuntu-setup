# change working dir to tmp dir
mkdir -p /tmp/ubuntu-setup
cd /tmp/ubuntu-setup

# install:
# - roboto font
# - adapta GTK theme
# - paper icon theme
# - gnome tweaks
sudo apt-add-repository ppa:tista/adapta -y
wget "https://snwh.org/paper/download.php?owner=snwh&ppa=ppa&pkg=paper-icon-theme,18.04" -O paper-icons.deb
sudo apt update
sudo apt install fonts-roboto adapta-gtk-theme gnome-tweak-tool -y
sudo gdebi -n paper-icons.deb

# set material design theme settings
gsettings set org.gnome.desktop.interface gtk-theme "Adapta"
gsettings set org.gnome.desktop.interface cursor-theme "Paper"
gsettings set org.gnome.desktop.interface icon-theme "Paper"

# disable desktop icons
gsettings set org.gnome.desktop.background show-desktop-icons false

# configure dock
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false # autohide
DOCK_APPS="['google-chrome.desktop', 'code.desktop']"
gsettings set org.gnome.shell favorite-apps "$DOCK_APPS" # set apps

# make terminal look cool
# https://askubuntu.com/a/954592
dconfdir='/org/gnome/terminal/legacy/profiles:'

create_new_profile() {
    local profile_ids=($(dconf list $dconfdir/ | grep ^: |\
                        sed 's/\///g' | sed 's/://g'))
    local profile_name="$1"
    local profile_ids_old="$(dconf read "$dconfdir"/list | tr -d "]")"
    local profile_id="$(uuidgen)"

    [ -z "$profile_ids_old" ] && local lb="["  # if there's no `list` key
    [ ${#profile_ids[@]} -gt 0 ] && local delimiter=,  # if the list is empty
    dconf write $dconfdir/list \
        "${profile_ids_old}${delimiter} '$profile_id']"
    dconf write "$dconfdir/:$profile_id"/visible-name "'$profile_name'"
    echo $profile_id
}

get_profile_uuid() {
    # Print the UUID linked to the profile name sent in parameter
    local profile_ids=($(dconf list $dconfdir/ | grep ^: |\
                        sed 's/\///g' | sed 's/://g'))
    local profile_name="$1"
    for i in ${!profile_ids[*]}; do
        if [[ "$(dconf read $dconfdir/:${profile_ids[i]}/visible-name)" == \
            "'$profile_name'" ]]; then
            echo "${profile_ids[i]}"
            return 0
        fi
    done
}

uuid=$(get_profile_uuid ubuntu-setup)

if [[ -z $uuid ]]
then
  uuid=$(create_new_profile ubuntu-setup)
fi

dconf write $dconfdir/:$uuid/use-theme-colors "false"
dconf write $dconfdir/:$uuid/background-color "'#000000'"
dconf write $dconfdir/:$uuid/foreground-color "'#FFFFFF'"
dconf write $dconfdir/:$uuid/use-theme-transparency "false"
dconf write $dconfdir/:$uuid/use-transparent-background "true"
dconf write $dconfdir/:$uuid/background-transparency-percent "20"

dconf write $dconfdir/default "'$uuid'"