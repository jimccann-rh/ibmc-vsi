variable "iaas_classic_api_key" {
  description = "IBM Cloud Classic API key"
  type        = string
  sensitive   = true
}

variable "iaas_classic_username" {
  description = "IBM Cloud Classic username"
  type        = string
  sensitive   = true
}

variable "project" {
  description = "Name prefix for resources"
  type        = string
  default     = "ci"
}

variable "domain_name" {
  description = "DNS domain for VSI"
  type        = string
  default     = "example.com"
}

variable "datacenter" {
  description = "Classic DC short name"
  type        = string
  default     = "dal10"
}

variable "ssh_key_labels" {
  description = "List of SSH key labels to attach"
  type        = list(string)
  default     = ["ci", "ci-sshkey-vsi"]
}

variable "hostname" {
  description = "VSI hostname"
  type        = string
  default     = "ci-redhat"
}

variable "network_speed" {
  description = "Mbps for public/private NICs"
  type        = number
  default     = 100
}

variable "os_reference_code" {
  description = "Classic OS reference code"
  type        = string
  default     = "REDHAT_9_64"
}

variable "vsi_private_vlan" {
  description = "Private VLAN ID to attach the VSI to"
  type        = number
  default     = null
}

variable "install_extra_software" {
  description = "If true, apply cloud-init to update OS and install extra packages"
  type        = bool
  default     = false
}

variable "enable_public_network" {
  description = "If true, enable public interface (public IP) on the VSI"
  type        = bool
  default     = false
}

variable "vsi_tag" {
  description = "Additional tag to apply to the VSI"
  type        = string
  default     = "vsphere"
}


