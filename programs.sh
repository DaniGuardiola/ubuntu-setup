# change working dir to tmp dir
mkdir -p /tmp/ubuntu-setup
cd /tmp/ubuntu-setup

# install latest chrome stable
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome.deb
sudo gdebi -n google-chrome.deb

# install fuck
sudo apt install python3-dev python3-pip python3-setuptools -y
sudo pip3 install thefuck

# install MEGAsync and the nautilus extension
wget https://mega.nz/linux/MEGAsync/xUbuntu_18.10/amd64/megasync_3.7.1_amd64.deb -O megasync.deb
sudo gdebi -n megasync.deb
wget https://mega.nz/linux/MEGAsync/xUbuntu_18.10/amd64/nautilus-megasync_3.6.6_amd64.deb -O megasync-nautilus.deb
sudo gdebi -n megasync-nautilus.deb