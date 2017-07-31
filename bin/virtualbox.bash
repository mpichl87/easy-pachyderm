__install_virtualbox_extension_pack() {
  wget http://download.virtualbox.org/virtualbox/5.1.26/Oracle_VM_VirtualBox_Extension_Pack-5.1.26-117224.vbox-extpack
  sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-5.1.26-117224.vbox-extpack --accept-license=715c7246dc0f779ceab39446812362b2f9bf64a55ed5d3a905f053cfab36da9e
  rm Oracle_VM_VirtualBox_Extension_Pack-5.1.26-117224.vbox-extpack
}

__install_virtualbox() {
  which VBoxManage &> /dev/null ||
  (
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" > virtualbox.list
    sudo mv virtualbox.list /etc/apt/sources.list.d/
    sudo apt update
    sudo apt -y install virtualbox-5.1
    __install_virtualbox_extension_pack
    sudo usermod -aG vboxusers $USER
    echo "Virtualbox installed; Reboot or log out before using virtualbox."
  )
}

__purge_virtualbox() {
  sudo apt purge -y virtualbox-5.1
  sudo rm  /etc/apt/sources.list.d/virtualbox.list
  sudo apt update
  sudo deluser $USER vboxusers
  sudo groupdel vboxusers
  echo "Virtualbox removed; Reboot or log out to finish."
}
#
#  Auto install doesn't work: user has to log out and in again for group 'vboxusers'
#
# virtualbox() {
#   ( which virtualbox &> /dev/null && command virtualbox "$@" ) ||
#   ( __install_virtualbox          && command virtualbox "$@" )
# }
