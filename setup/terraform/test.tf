resource "virtualbox_vm" "node" {
  count     = 1
  name      = "${format("node-%02d", count.index+1)}"
  url       = "https://vagrantcloud.com/ubuntu/boxes/bento/versions/201803.24.0/providers/virtualbox.box"
  image     = "./virtualbox-ubuntu.box"
  cpus      = 1
  memory    = "1024 mib"
  user_data = "${file("user_data")}"
}

output "IPAddr" {
  value = "${element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)}"
}

output "IPAddr_2" {
  value = "${element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 2)}"
}
