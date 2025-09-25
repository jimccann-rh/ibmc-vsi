output "vsi_id" {
  value = ibm_compute_vm_instance.vsi.id
}

output "public_ip" {
  value = ibm_compute_vm_instance.vsi.ipv4_address
}

output "private_ip" {
  value = ibm_compute_vm_instance.vsi.ipv4_address_private
}


