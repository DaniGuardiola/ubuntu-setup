# Run:
# $(wget -qO - ubuntu.daniguardiola.me | bash)

if [ $# -eq 0 ]
  then
    cd /tmp
    rm -rf .ubuntu-setup ubuntu-setup.zip
    wget -q --no-cache -O ubuntu-setup.zip https://github.com/DaniGuardiola/ubuntu-setup/archive/master.zip
    unzip ubuntu-setup.zip -d /tmp
    cd .ubuntu-setup 
    echo "source run.sh 1"
    exit
fi