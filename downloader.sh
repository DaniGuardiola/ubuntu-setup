# Run:
# $(wget -qO - ubuntu.daniguardiola.me | bash)

if [ $# -eq 0 ]
  then
    cd /tmp
    rm -rf .ubuntu-setup ubuntu-setup.zip
    wget -q --no-cache -O ubuntu-setup.zip https://github.com/DaniGuardiola/ubuntu-setup/archive/master.zip
    unzip -q ubuntu-setup.zip -d /tmp
    mv ubuntu-setup-master .ubuntu-setup
    touch .ubuntu-setup-run.sh
    chmod +x .ubuntu-setup-run.sh
    echo "cd /tmp/.ubuntu-setup" >> .ubuntu-setup-run.sh
    echo "./run.sh" >> .ubuntu-setup-run.sh
    echo './.ubuntu-setup-run.sh'
    exit
fi