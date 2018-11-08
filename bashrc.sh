# ubuntu-setup start

# like npx for apt
apx() {
  if [[ -z $1 ]]
  then
    echo "Error: package not specified - apx <package> [<...parameters>]"
  else
    echo "> Installing and running: $@"
    sudo DEBIAN_FRONTEND=noninteractive apt-get -q install $1 -qq < /dev/null > /dev/null
    if [ $? -eq 0 ]; then
      $@
      sudo DEBIAN_FRONTEND=noninteractive apt-get -q remove --purge $1 -qq < /dev/null > /dev/null
      echo "> Cleaned up $1 :)"
    else
      echo "> Some error happened and the package couldn't be installed :("
    fi
  fi
}

# fuck
eval $(thefuck --alias)

# set vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# ubuntu-setup end