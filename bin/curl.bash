__install_curl() {
  sudo apt install -y curl &> /dev/null
}

__purge_curl() {
  sudo apt purge -y curl
}

curl() {
  ( which curl &> /dev/null || __install_curl ) &&
  command curl "$@"
}
