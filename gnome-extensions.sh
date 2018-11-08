# install Gnome shell extension manager
sudo wget -O /usr/local/sbin/gnomeshell-extension-manage https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage
sudo chmod +x /usr/local/sbin/gnomeshell-extension-manage

# install and configure Gnome shell extensions

# hidetopbar
gnomeshell-extension-manage --install --system --version latest --extension-id 545
HIDETOPBAR_SCHEMA_DIR="/usr/local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/"
gsettings --schemadir ${HIDETOPBAR_SCHEMA_DIR} set org.gnome.shell.extensions.hidetopbar mouse-sensitive true

# places menu
gnomeshell-extension-manage --install --system --version latest --extension-id 8

# removable drive menu
gnomeshell-extension-manage --install --system --version latest --extension-id 7

# application menu
gsettings set org.gnome.shell enable-hot-corners true # enable hot corners to make it work
gnomeshell-extension-manage --install --system --version latest --extension-id 6

# Sound Input & Output Device Chooser
gnomeshell-extension-manage --install --system --version latest --extension-id 906

# screenshot tool
gnomeshell-extension-manage --install --system --version latest --extension-id 1112

# clipboard indicator
gnomeshell-extension-manage --install --system --version latest --extension-id 779
CLIPBOARDINDICATOR_SCHEMA_DIR="/usr/local/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com/schemas/"
gsettings --schemadir ${CLIPBOARDINDICATOR_SCHEMA_DIR} set org.gnome.shell.extensions.clipboard-indicator notify-on-copy false

# show battery percentage
gnomeshell-extension-manage --install --system --version latest --extension-id 818

# autohide battery
gnomeshell-extension-manage --install --system --version latest --extension-id 595

# Top Panel Workspace Scroll
gnomeshell-extension-manage --install --system --version latest --extension-id 701

# middle click to close in overview
gnomeshell-extension-manage --install --system --version latest --extension-id 352
