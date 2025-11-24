resource "openstack_compute_instance_v2" "backend" {
  name            = "vm-backend"
  flavor_name     = "m1.small"
  image_name      = var.image
  key_pair        = var.key
  security_groups = ["default"]

  network {
    uuid = openstack_networking_network_v2.net.id
  }

  user_data = <<EOF
#!/bin/bash
apt update -y
apt install docker.io -y
docker run -d --name backend -p 5000:5000 mounir/backend:latest
EOF
}
