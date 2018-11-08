# ubuntu-setup start

# like npx for apt
apx() {
  if [[ -z $1 ]]
  then
    echo "Error: package not specified - apx <package> [<...parameters>]"
  else
    echo '> Running: $@'
    sudo apt install $1 -y && $@ && sudo apt remove --purge $1 -y
  fi
}

# fuck
eval $(thefuck --alias)

# set vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# ubuntu-setup end