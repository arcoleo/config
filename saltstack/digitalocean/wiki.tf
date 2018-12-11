# setup connection to digitalocen using the API token
# provider "digitalocean" {
#   token = "${var.do_token}"
# }

# public DigitalOcean SSH key
# resource "digitalocean_ssh_key" "default" {
#   name       = "Terraform Example"
#   public_key = "${file(var.pub_key)}"
# }

# setup one small virtual server in Frankfurt.
resource "digitalocean_droplet" "wiki" {
  image  = 21669205
  name   = "wiki"
  region = "sfo1"
  size   = "1gb"

  # install this SSH key on the machine so we can access it later
  ssh_keys = [
    "${var.ssh_fingerprint}",
  ]

  # ensure that ssh key is available before we setup this machine
  # as in terraform 0.4.2 there is no automatic dependency here (TODO)
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
      "add-apt-repository ppa:openjdk-r/ppa --yes",
      "apt-get update",

      # install salt-minion and salt-master, but don't start services
      "curl -L https://bootstrap.saltstack.com | sh -s -- -M -X -A localhost",

      "rm /srv/salt",
      "mkdir /srv/salt",
    ]

    # work around possible missing executable flag
    # "cat /tmp/complete-bootstrap.sh | sh -s",
  }

  provisioner "file" {
    source      = "salt/salt.master"
    destination = "/etc/salt/master"
  }

  provisioner "file" {
    source      = "salt/salt.minion"
    destination = "/etc/salt/minion"
  }

  provisioner "file" {
    source      = "salt/nettools.sls"
    destination = "/srv/salt/nettools.sls"
  }

  provisioner "file" {
    source      = "salt/examples.sls"
    destination = "/srv/salt/examples.sls"
  }

  provisioner "file" {
    source      = "salt/java.sls"
    destination = "/srv/salt/java.sls"
  }

  provisioner "remote-exec" {
    inline = [
      "service salt-master restart",
      "service salt-minion restart",
    ]
  }
}
