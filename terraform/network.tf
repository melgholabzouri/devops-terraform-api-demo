resource "openstack_networking_network_v2" "net" {
  name = "net-api-demo"
}

resource "openstack_networking_subnet_v2" "subnet" {
  name            = "subnet-api-demo"
  network_id      = openstack_networking_network_v2.net.id
  cidr            = "192.168.50.0/24"
  ip_version      = 4
  gateway_ip      = "192.168.50.1"
}

resource "openstack_networking_router_v2" "router" {
  name                = "router-api-demo"
  external_network_id = var.external_network_id
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet.id
}
