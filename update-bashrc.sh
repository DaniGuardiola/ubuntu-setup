START_LINE=$(grep -Fn '# ubuntu-setup start' ~/.bashrc | cut -f 1 -d ':')
END_LINE=$(grep -Fn '# ubuntu-setup end' ~/.bashrc | cut -f 1 -d ':')

if [[ -z $START_LINE ]]
then
  echo "No .bashrc insertions detected"
else
  sed -i.bak -e "$START_LINE,${END_LINE}d" ~/.bashrc
fi

cat bashrc.sh >> ~/.bashrc