__install_kubectl() {
    local release_url="https://storage.googleapis.com/kubernetes-release/release"
    local stable_release="$(curl -s ${release_url}/stable.txt)"
    curl -LO "${release_url}/${stable_release}/bin/linux/amd64/kubectl" &> /dev/null &&
    chmod +x ./kubectl &> /dev/null &&
    sudo mv ./kubectl /usr/local/bin/ &> /dev/null
}

__purge_kubectl() {
    sudo rm /usr/local/bin/kubectl
}

kubectl() {
  ( which kubectl &> /dev/null || __install_kubectl ) &&
  command kubectl "$@"
}
