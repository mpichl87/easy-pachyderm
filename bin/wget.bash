__install_wget() {
  sudo apt install -y wget &> /dev/null
}

__purge_wget() {
  sudo apt purge -y wget
}

wget() {
  ( which wget &> /dev/null || __install_wget ) &&
  command wget "$@"
}
