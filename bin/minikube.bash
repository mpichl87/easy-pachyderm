__link_minikube_dotfiles() {
  mkdir /home_local/$USER &> /dev/null ||
  mkdir /home_local/$USER/.minikube &> /dev/null ||
  ln -s /home_local/$USER/.minikube /home/$USER &> /dev/null ||
  :
}

__install_minikube() {
  curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.21.0/minikube-linux-amd64 &> /dev/null &&
  chmod +x minikube &> /dev/null &&
  sudo mv minikube /usr/local/bin/ &> /dev/null &&
  __link_minikube_dotfiles
}

__purge_minikube() {
  sudo rm /usr/local/bin/minikube
}

minikube() {
  ( which minikube &> /dev/null || __install_minikube ) &&
  command minikube "$@"
}
