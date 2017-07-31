# easy-pachyderm

Easy to use Pachyderm Installation.

## Ubuntu  ( tested with Xenial 16.04 )

- Clone the Repo:

      git clone https://github.com/mpichl87/easy-pachyderm.git
      cd easy-pachyderm
      

- Activate Environmment:

      source ./env

- Optionally install Virtualbox:

      __install_virtualbox

- Other commandos self-install automatically:

      kubectl
      minikube
      pachctl

## Windows 10

- pachctl: v1.5.0
- kubectl: v1.7.1

### Usage 

- Install Chocolatey:

  https://chocolatey.org/install

- Install Vagrant:

      choco install vagrant

- Start Pachyderm Box from the Repo:

      git clone https://github.com/mpichl87/easy-pachyderm.git
      cd easy-pachyderm
      vagrant up
      vagrant ssh
           
- Or initialize a fresh Box:

       mkdir testproject
       cd testproject
       vagrant init mpichl87/pachyderm --box-version 1.0.0
       vagrant up
       vagrant ssh


