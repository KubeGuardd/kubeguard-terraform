variable "aks_cluster_name" {
  type        = string
  description = "AKS cluster name."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "aks_identity_name" {
  type        = string
  description = "AKS user-assigned identity name."
}

variable "aks_node_pool_name" {
  type        = string
  description = "AKS default node pool name."
}

variable "aks_vm_size" {
  type        = string
  description = "AKS node VM size."
}

variable "aks_node_count_min" {
  type        = number
  description = "Minimum node count."
}

variable "aks_node_count_max" {
  type        = number
  description = "Maximum node count."
}

variable "aks_availability_zones" {
  type        = list(string)
  description = "AKS node pool availability zones."
}

variable "aks_service_cidr" {
  type        = string
  description = "AKS service CIDR."
}

variable "aks_dns_service_ip" {
  type        = string
  description = "AKS DNS service IP."
}

variable "aks_subnet_id" {
  type        = string
  description = "AKS subnet resource ID."
}

variable "acr_id" {
  type        = string
  description = "Container Registry resource ID."
}
