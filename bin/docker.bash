__install_docker() {
  which docker &> /dev/null ||
  (
    curl -sSL https://get.docker.com/ | sudo sh
    sudo groupadd docker
    sudo usermod -aG docker $USER
    echo "Docker installed; Reboot or log out before using docker."
  )
}

__purge_docker() {
  sudo apt purge -y docker-ce
  sudo deluser $USER docker
  sudo groupdel docker
  echo "Docker removed; Reboot or log out to finish."
}
#
#  Auto install doesn't work: user has to log out and in again for group 'docker'
#
# docker() {
#   ( which docker &> /dev/null && command docker "$@" ) ||
#   ( __install_docker          && command docker "$@" )
# }
