# -*- mode: ruby -*-
# vi: set ft=ruby :
#
#

PUPPETSERVER_IP="192.168.15.2"
PUPPETAGENT_IP="192.168.15.3"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "rockylinux/9"

  config.vm.provision "shell", inline: %Q{
    cp -r /vagrant/.vim* /root
    cp -r /vagrant/profile /etc/profile.d/puppet-training.sh
    rpm -Uvh https://yum.puppet.com/puppet-release-el-9.noarch.rpm
    yum -y install git vim tree
  }

  config.vm.define 'puppet' do |puppet|
    puppet.vm.hostname = 'puppet.localdomain'
    puppet.vm.network "private_network", ip: PUPPETSERVER_IP
    puppet.vm.provision "shell", inline: %Q{
      echo 'export PATH=$PATH:/opt/puppetlabs/puppet/bin' >> /root/.bashrc
   }

    puppet.vm.provider :virtualbox do |v|
      v.memory = 4096
    end
  end

  config.vm.define 'agent', autostart: false do |agent|
    agent.vm.hostname = 'agent.localdomain'
    agent.vm.provision "shell", inline: %Q{
      echo 'export PATH=$PATH:/opt/puppetlabs/puppet/bin' >> /root/.bashrc
      echo "#{PUPPETSERVER_IP} puppet" >> /etc/hosts
    }
    agent.vm.network "private_network", ip: PUPPETAGENT_IP
  end

end
