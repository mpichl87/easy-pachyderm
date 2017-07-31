# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "flixtech/kubernetes"
  config.vm.provision "file",
    source: "./files/kubelet.service",
    destination: "/tmp/kubelet.service"
  config.vm.provision "file",
    source: "./files/kube-apiserver.service",
    destination: "/tmp/kube-apiserver.service"
  config.vm.provision "shell",
    privileged: true,
    inline:  <<-SHELL
      mv /tmp/kubelet.service /etc/systemd/system/
      mv /tmp/kube-apiserver.service /etc/systemd/system/
      systemctl daemon-reload
      service kubelet restart
      service kube-apiserver restart
      apt install -y curl
      curl -o /tmp/pachctl.deb -L https://github.com/pachyderm/pachyderm/releases/download/v1.5.0/pachctl_1.5.0_amd64.deb && sudo dpkg -i /tmp/pachctl.deb
    SHELL
  config.vm.provision "shell",
    inline: "pachctl deploy local"
end
