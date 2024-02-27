# data "vsphere_host_thumbprint" "thumbprint" {
#   address = "esxi01.h2o-2-22818.h2o.vmware.com"
#   insecure = true
# }

# data "vsphere_host" "host" {
#   count         = length(var.hosts)
#   name          = var.hosts[count.index]
# #   datacenter_id = vsphere_datacenter.dc.id
# }