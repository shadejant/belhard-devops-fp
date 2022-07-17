variable "dc" {
  type = string
}

variable "cluster" {
  type = string
}

variable "host" {
  type = string
}

variable "vswitch" {
  type = string
}

variable "dns_servers" {
  default = ["8.8.8.8", "8.8.4.4"]
}

variable "vm" {
  hostname {
    type = string
  }
  vcpu {
    type = string
  }
  ram {
    type = string
  }
  disk_datastore {
    type = string
  }
  disk_size {
    type = string
  }

}






data "vsphere_datacenter" "dc" {
  name = var.dc
}