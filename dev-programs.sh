# change working dir to tmp dir
oldDir=$PWD
mkdir -p /tmp/ubuntu-setup
cd /tmp/ubuntu-setup

# install:
# - vim
# - vscode
# - curl
# - git
# - meld (diff tool)
wget "https://update.code.visualstudio.com/latest/linux-deb-x64/stable" -O vscode.deb
sudo apt install curl git vim meld -y
sudo gdebi -n vscode.deb

# install nvm and node (last version)
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node
nvm use node
nvm alias default node

# install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn -y