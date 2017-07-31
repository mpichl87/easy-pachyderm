__install_pachctl() {
    local url="https://github.com/pachyderm/pachyderm/releases/download/v1.5.0/pachctl_1.5.0_amd64.deb"
    local stable_release="$(curl -s ${release_url}/stable.txt)"
    curl -o /tmp/pachctl.deb -L ${url} &> /dev/null &&
    sudo dpkg -i /tmp/pachctl.deb &> /dev/null
}

__purge_pachctl() {
  sudo dpkg -r pachctl
}

pachctl() {
  ( which pachctl &> /dev/null || __install_pachctl ) &&
  command pachctl "$@"
}
