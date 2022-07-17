provider "vsphere" {
  user                 = "VSPHERE.LOCAL\\bh-devops"
  password             = "12345678"
  vsphere_server       = "ncavcenter"
  allow_unverified_ssl = true
}
