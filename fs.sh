# create projects and apps dirs
mkdir ~/projects ~/apps

# remove default home dirs and rename Downloads to lowercase downloads
rm -rf ~/Desktop ~/Documents ~/Music ~/Pictures ~/Public ~/Templates ~/Videos ~/examples.desktop && mv ~/Downloads ~/downloads
cat user-dirs.dirs ~/.config/user-dirs.dirs
xdg-user-dirs-update

# set bookmarks
cat bookmarks > ~/.config/gtk-3.0/bookmarks