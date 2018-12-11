resource "digitalocean_droplet" "minion" {
  image  = 21669205
  name   = "minion1"
  region = "sfo1"
  size   = "1gb"

  # install this SSH key on the machine so we can access it later
  ssh_keys = [
    "${var.ssh_fingerprint}",
  ]

  depends_on = ["digitalocean_ssh_key.default"]

  connection {
    user        = "root"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "wget -qO - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -",
      "echo 'deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main' > /etc/apt/sources.list.d/saltstack.list",
      "apt-get update",
      "apt-get --yes install salt-minion salt-ssh",
    ]
  }

  # provisioner "file" {
  #   # ${digitalocean_droplet.haproxy-www.ipv4_address}
  #   # master: salt.localdomain
  #   source = "salt/salt.minion"


  #   destination = "/etc/salt/minion"
  # }

  provisioner "remote-exec" {
    inline = [
      "echo 'master: 138.68.193.160' > /etc/salt/minion",
    ]
  }
}
