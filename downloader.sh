if [ $# -eq 0 ]
  then
    cd /tmp
    wget -q --no-cache -O ubuntu-setup.zip https://github.com/DaniGuardiola/ubuntu-setup/archive/master.zip
    unzip ubuntu-setup.zip -d .ubuntu-setup
    cd .ubuntu-setup 
    echo "source run.sh 1"
    exit
fi