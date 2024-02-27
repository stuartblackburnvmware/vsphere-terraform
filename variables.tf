variable "vsphere_user" {
  type        = string
  description = "vSphere User"
  default     = "Administrator@vsphere.local"
}

variable "vsphere_password" {
  type        = string
  description = "vSphere Password"
}

variable "vsphere_server" {
  type        = string
  description = "vCenter Server"
}

variable "datacenter_name" {
  type        = string
  description = "Datacenter Name"
}

variable "hosts" {
  type = list
  description = "List of ESXi hostnames"
  default = [
    "esxi01.h2o-2-22818.h2o.vmware.com"
    ]
}