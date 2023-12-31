# All examples presume that you have a ~/.fog credentials file set up.
# More info on it can be found here: http://fog.io/about/getting_started.html

require "bundler"
Bundler.require(:default, :development)
# Uncomment this if you want to make real requests to GCE (you _will_ be billed!)
# WebMock.disable!

def test
  connection = Fog::Compute.new(:provider => "Google")

  puts "Creating a new private network..."
  puts "---------------------------------"
  network = connection.networks.create(
    :name => "test-private-network",
    :ipv4_range => "10.240.0.0/16"
  )

  name = "fog-smoke-test-#{Time.now.to_i}"

  puts "Creating a disk for an instance..."
  puts "---------------------------------"
  disk = connection.disks.create(
    :name => name,
    :size_gb => 10,
    :zone_name => "us-central1-a",
    :source_image => "debian-11-bullseye-v20220920"
  )

  disk.wait_for { disk.ready? }

  puts "Spinning up an instance with private network config..."
  puts "------------------------------------------------------"
  server = connection.servers.create(
    :name => name,
    :disks => [disk],
    :machine_type => "n1-standard-1",
    :zone_name => "us-central1-a",
    :private_key_path => File.expand_path("~/.ssh/id_rsa"),
    :public_key_path => File.expand_path("~/.ssh/id_rsa.pub"),
    :network => network,
    :external_ip => false,
    :username => ENV["USER"]
  )

  # The network won't have any firewall rules, so we won't be able to ssh in.
  server.wait_for { ready? }

  raise "Could not delete server." unless server.destroy
  raise "Could not delete network." unless network.destroy
rescue StandardError => e
  p e.message
end

test
