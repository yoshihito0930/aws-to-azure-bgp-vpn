variable "common_tags" {
  type = map(any)
  default = {
    "Provisioner" = "Terraform Cloud"
  }
  description = "AWS to Azure High Availability BGP VPN"
}

###
# AWS VARIABLES
###

variable "aws_location" {
  type        = string
  default     = "ap-northeast-1"
  description = "AWS Region"
}

variable "aws_location_prefix" {
  type        = string
  default     = "tidb-test-vpc-ap-northeast-1"
  description = "Name for Created Resources"
}

variable "aws_vpc_id" {
  type        = string
  default     = "vpc-096a5831b5bc7136b"
}

###
# AZURE VARIABLES
###

variable "azure_location" {
  type        = string
  default     = "japaneast"
  description = "Azure Region"
}

variable "azure_location_prefix" {
  type        = string
  default     = "EUS"
  description = "Add EUS for naming convention on Resources"
}

variable "azure_resource_group" {
  type        = string
  default     = "test-tidb"
  description = "Azure Resource Group"
}

variable "azure_vnet_name" {
  type        = string
  default     = "tidb-test-vnet"
  description = "Azure Virtual Network"
}

variable "azure_gateway_subnet_cidr" {
  type        = string
  default     = "192.168.0.0/16"
  description = "Azure Gateway Subnet CIDR\nThe cidr of the GatewaySubnet must be a subset of the cidr of the vnet"
}

variable "azure_vpn_gateway_map" {
  type        = map(any)
  default = {
    sku        = "VpnGw3"
    generation = "Generation1"
  }
  description = "Azure VPN Gateway SKU and Generation"
  # see https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways#benchmark
}

###
# 下記は変更不要
###

variable "aws_vpn_bgp_asn" {
  type        = number
  default     = 64512
  description = "AWS BGP ASN"
}

variable "aws_vpn_bgp_peering_cidr_1" {
  type        = string
  default     = "169.254.21.0/30"
  description = "AWS VPN BGP CIDR Peer"
}

variable "aws_vpn_bgp_peering_cidr_2" {
  type        = string
  default     = "169.254.22.0/30"
  description = "AWS VPN BGP CIDR Peer"
}

variable "aws_vpn_bgp_peering_cidr_3" {
  type        = string
  default     = "169.254.21.4/30"
  description = "AWS VPN BGP CIDR Peer"
}

variable "aws_vpn_bgp_peering_cidr_4" {
  type        = string
  default     = "169.254.22.4/30"
  description = "AWS VPN BGP CIDR Peer"
}

variable "aws_vpn_bgp_peering_address_1" {
  type        = string
  default     = "169.254.21.1"
  description = "AWS VPN BGP Peer IP Address"
}

variable "aws_vpn_bgp_peering_address_2" {
  type        = string
  default     = "169.254.22.1"
  description = "AWS VPN BGP Peer IP Address"
}

variable "aws_vpn_bgp_peering_address_3" {
  type        = string
  default     = "169.254.21.5"
  description = "AWS VPN BGP Peer IP Address"
}

variable "aws_vpn_bgp_peering_address_4" {
  type        = string
  default     = "169.254.22.5"
  description = "AWS VPN BGP Peer IP Address"
}


variable "azure_vpn_bgp_asn" {
  type        = number
  default     = 65515
  description = "Azure BGP ASN"
}

variable "azure_vpn_bgp_peering_cidr_1" {
  type        = string
  default     = "169.254.21.0/30"
  description = "Azure VPN BGP CIDR Peer"
}

variable "azure_vpn_bgp_peering_cidr_2" {
  type        = string
  default     = "169.254.22.0/30"
  description = "Azure VPN BGP CIDR Peer"
}

variable "azure_vpn_bgp_peering_cidr_3" {
  type        = string
  default     = "169.254.21.4/30"
  description = "Azure VPN BGP CIDR Peer"
}

variable "azure_vpn_bgp_peering_cidr_4" {
  type        = string
  default     = "169.254.22.4/30"
  description = "Azure VPN BGP CIDR Peer"
}

variable "azure_vpn_bgp_peering_address_1" {
  type        = string
  default     = "169.254.21.2"
  description = "Azure VPN BGP Peer IP Address"
}

variable "azure_vpn_bgp_peering_address_2" {
  type        = string
  default     = "169.254.22.2"
  description = "Azure VPN BGP Peer IP Address"
}

variable "azure_vpn_bgp_peering_address_3" {
  type        = string
  default     = "169.254.21.6"
  description = "Azure VPN BGP Peer IP Address"
}

variable "azure_vpn_bgp_peering_address_4" {
  type        = string
  default     = "169.254.22.6"
  description = "Azure VPN BGP Peer IP Address"
}
