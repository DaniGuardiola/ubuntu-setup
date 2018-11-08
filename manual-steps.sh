# execute semi-manual steps in order
printf '\n\n\nAlmost done!'
printf '\nNow some actions are required, please follow these steps to complete the setup.\n'
read -p '>> Press enter when ready to start'

# MEGAsync
printf '\n\nMEGAsync will open, configure the following things:\n- Log into your account and choose selective sync\n- Add ~/MEGAsync, ~/projects and ~/apps to synced dirs\n- Add "node_modules" to ignored in settings\n- Remove ".*" (hidden files - for example .git/ dirs) from ignored\n- Restart MEGAsync\n'

read -p '>> Press enter to open MEGAsync'

megasync &

read -p '>> Press enter when done to go to the next step'

# Chrome
printf '\n\nChrome will open, log into your Google account\n'

read -p '>> Press enter to open Chrome'

google-chrome

read -p '>> Press enter to go to the next step'

# Git
read -p 'What name do you want to use with git? ' GIT_NAME
read -p 'What email do you want to use with git? ' GIT_EMAIL

git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_NAME
git config --global push.default simple
git config --global commit.template "$HOME/projects/git-commit-template"

printf '\n\nKeep in mind that you need to have a "git-commit-template" file inside your ~/projects dir!\nThe content of the file will be the template for commit messages globally.\n\n'
read -p '>> Press enter to go to the next step'
# ssh keys
printf '\n\nNow the default SSH key will be generated, without a passphrase, for authentication in services like Github or Gitlab\n'
read -p 'What label do you want to use in the key? ' KEY_LABEL
yes '' | ssh-keygen -t rsa -b 4096 -C $KEY_LABEL
printf '\nThis is your default public key ~/.ssh/id_rsa.pub:\n\n'
cat "$HOME/.ssh/id_rsa.pub"
printf '\n\nCopy the key and save it in the services you want to authenticate with. Common services:\n- Github https://github.com/settings/ssh/new\n- Gitlab https://gitlab.com/profile/keys\n\n'
read -p '>> Press enter to go to the next step'
# Logout!
printf '\n\nDONE! Everything should be set up now.\n'
read -p '>> Press enter to finish. You will get logged out, just log in again and enjoy!'
gnome-session-quit --force