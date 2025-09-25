output "vsi_id" {
  value = ibm_compute_vm_instance.vsi.id
}

output "public_ip" {
  value = var.enable_public_network ? ibm_compute_vm_instance.vsi.ipv4_address : null
}

output "private_ip" {
  value = ibm_compute_vm_instance.vsi.ipv4_address_private
}


