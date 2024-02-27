provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

# Define vSphere datacenter
# resource "vsphere_datacenter" "dc" {
#   name = var.datacenter_name
# }

data "vsphere_datacenter" "dc" {
  name = var.datacenter_name
}

# # Define vSphere cluster
# resource "vsphere_compute_cluster" "compute_cluster" {
#   name            = "terraform-compute-cluster-test"
#   datacenter_id   = vsphere_datacenter.dc.id
#   host_system_ids = [data.vsphere_host.host.*.id]

#   drs_enabled          = true
#   drs_automation_level = "fullyAutomated"

#   ha_enabled = true
# }

# # Define vSphere ESXi hosts
# resource "vsphere_host" "esxi" {
#   count         = length(var.esxi_hosts)
#   name          = var.esxi_hosts[count.index]
# #   cluster_id    = vsphere_cluster.cluster.id
#   datacenter_id = vsphere_datacenter.dc.id
# }

data "vsphere_host_thumbprint" "thumbprint" {
  count         = length(var.hosts)
  address = var.hosts[count.index]
  insecure = true
}

data "vsphere_host" "host" {
  count         = length(var.hosts)
  name          = var.hosts[count.index]
  datacenter_id = data.vsphere_datacenter.dc.id
}