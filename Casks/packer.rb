class Packer < Cask
  version '0.7.0'
  sha256 '9866e16075a6dced7afb22cf151dd85062cc5a538cb5d5a3a3bfbe4e3f5ed2e6'

  url "https://dl.bintray.com/mitchellh/packer/packer_#{version}_darwin_amd64.zip"
  homepage 'http://www.packer.io/'

  binary 'packer'
  binary 'packer-builder-amazon-chroot'
  binary 'packer-builder-amazon-ebs'
  binary 'packer-builder-amazon-instance'
  binary 'packer-builder-digitalocean'
  binary 'packer-builder-docker'
  binary 'packer-builder-googlecompute'
  binary 'packer-builder-null'
  binary 'packer-builder-openstack'
  binary 'packer-builder-parallels-iso'
  binary 'packer-builder-parallels-pvm'
  binary 'packer-builder-qemu'
  binary 'packer-builder-virtualbox-iso'
  binary 'packer-builder-virtualbox-ovf'
  binary 'packer-builder-vmware-iso'
  binary 'packer-builder-vmware-vmx'
  binary 'packer-command-build'
  binary 'packer-command-fix'
  binary 'packer-command-inspect'
  binary 'packer-command-validate'
  binary 'packer-post-processor-compress'
  binary 'packer-post-processor-docker-import'
  binary 'packer-post-processor-docker-push'
  binary 'packer-post-processor-docker-save'
  binary 'packer-post-processor-docker-tag'
  binary 'packer-post-processor-vagrant'
  binary 'packer-post-processor-vagrant-cloud'
  binary 'packer-post-processor-vsphere'
  binary 'packer-provisioner-ansible-local'
  binary 'packer-provisioner-chef-client'
  binary 'packer-provisioner-chef-solo'
  binary 'packer-provisioner-file'
  binary 'packer-provisioner-puppet-masterless'
  binary 'packer-provisioner-puppet-server'
  binary 'packer-provisioner-salt-masterless'
  binary 'packer-provisioner-shell'
end
