Vagrant.configure "2" do |config|

  # See https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Boxes for more boxes.
  config.vm.box     = "precise64_base"
  config.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

  config.omnibus.chef_version = :latest

  config.vm.provider :aws do |aws, override|
    aws.access_key_id = "YOUR AWS KEY ID"
    aws.secret_access_key = "YOUR AWS SECRET KEY"
    aws.keypair_name = "YOUR KEYPAIR NAME"    
    aws.region = "YOUR AWS REGION"
    aws.tags = {
      'hashtag' => 'jmeter-cookbook'
    }
  end

  # define multiple VMs.
  config.vm.define :vm1
  config.vm.define :vm2

  config.vm.provider "virtualbox" do |vm|
    vm.customize ["modifyvm", :id, "--nictype1", "Am79C973", "--memory", "1536", "--cpus", "2", "--ioapic", "on"]
    vm.customize ["modifyvm", :id, "--rtcuseutc", "on"]
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.log_level      = :debug

    chef.add_recipe     "apt"
    chef.add_recipe     "git"
    chef.add_recipe     "java::openjdk7"
    chef.add_recipe     "jmeter"
  end
end
