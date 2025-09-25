locals {
  tags = [
    "project:${var.project}",
    "datacenter:${var.datacenter}",
    "provider:ibm-classic"
  ]
}

# Look up SSH keys by label so we can pass their IDs
data "ibm_compute_ssh_key" "by_label" {
  count = length(var.ssh_key_labels)
  label = var.ssh_key_labels[count.index]
}

resource "ibm_compute_vm_instance" "vsi" {
  hostname                 = var.hostname
  domain                   = var.domain_name
  datacenter               = var.datacenter
  os_reference_code        = var.os_reference_code
  network_speed            = var.network_speed
  hourly_billing           = true
  local_disk               = false
  private_network_only     = !var.enable_public_network
  dedicated_acct_host_only = false
  ipv6_enabled             = var.enable_public_network

  # Balanced | B1.2x4 profile
  flavor_key_name          = "B1_2X4X25"

  # Public multi-tenant, attach keys
  ssh_key_ids              = [for k in data.ibm_compute_ssh_key.by_label : k.id]

  # Optional: place VSI on a specific private VLAN
  private_vlan_id          = var.vsi_private_vlan

  user_metadata            = var.install_extra_software ? file("${path.module}/cloud-init.yml") : null

  tags                     = local.tags
}


