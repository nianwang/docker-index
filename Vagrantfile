# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  # Fix docker not being able to resolve private registry in VirtualBox
  config.vm.provider :virtualbox do |vb, override|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.define "mariadb" do |m|
    m.vm.network "forwarded_port", guest: 3306, host: 3307, auto_correct: true
    m.vm.provision "docker" do |d|
      d.build_image "/vagrant/mariadb", args: "-t mariadb"
      d.run "mariadb", args: "-p 3306:3306 -v /opt/mysql:/var/lib/mysql"
    end
  end

  config.vm.define "nginx-php5" do |np|
    np.vm.network "forwarded_port", guest: 80, host: 8000, auto_correct: true
    np.vm.synced_folder "./", "/opt/www", group: "www-data"

    np.vm.provision "docker" do |d|
      d.build_image "/vagrant/nginx-php5", args: "-t nginx-php5"
      d.run "nginx-php5", args: "-p 80:80 -v /opt/www:/var/www"
    end
  end
end
