# AWS to Azure HA BGP VPN
This GitHub repository provides a module that can be used to set up a highly available (HA) BGP VPN connection between an Azure virtual network and an AWS VPC.

※ The main code for this module is based on the following GitHub repository: https://github.com/aws-samples/terraform-aws-windows-workloads-on-aws/tree/v1.1.3/modules/aws-to-azure-bgp-vpn. However, I have made some modifications to make this module more cohesive and focused on only setting up the VPN connection, as well as fixing some bugs.

## Usage
To use this module, follow these steps:
- Create a virtual network in Azure.
- Create a VPC in AWS.
- Use this module by passing in the resource IDs or names of the existing resources in Azure and AWS.


## Providers
- hashicorp/aws | version = ">=4.29.0"
- hashicorp/azure | version = ">=3.21.1"

## Variables description
- **common_tags (map(any))**: AWS to Azure High Availability BGP VPN
- **aws_location (string)**: AWS Region
- **aws_location_prefix (string)**: Name for Created Resources
- **aws_vpc_id(string)**: VPC id in AWS
- **azure_location (string)**: Azure Region
- **azure_location_prefix (string)**: Add EUS for naming convention on Resources
- **azure_resource_group**: resource group in Azure
- **azure_vnet_name**: VNet name in Azure
- **azure_gateway_subnet_cidr**: The cidr of the GatewaySubnet must be a subset of the cidr of the vnet
- **azure_vpn_gateway_map map(string)**:
  - **sku**: default "VpnGw3"  
  - **generation**: default "Generation1" , please check [https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways#benchmark|here]

**Do NOT** change the bgp routing peers as these are predefined
- **aws_vpn_bgp_asn (number)**: AWS BGP ASN
- **aws_vpn_bgp_peering_cidr_1 (string)**: AWS VPN BGP CIDR Peer
- **aws_vpn_bgp_peering_cidr_2 (string)**: AWS VPN BGP CIDR Peer
- **aws_vpn_bgp_peering_cidr_3 (string)**: AWS VPN BGP CIDR Peer
- **aws_vpn_bgp_peering_cidr_4 (string)**: AWS VPN BGP CIDR Peer
- **aws_vpn_bgp_peering_address_1 (string)**: AWS VPN BGP Peer IP Address
- **aws_vpn_bgp_peering_address_2 (string)**: AWS VPN BGP Peer IP Address
- **aws_vpn_bgp_peering_address_3 (string)**: AWS VPN BGP Peer IP Address
- **aws_vpn_bgp_peering_address_4 (string)**: AWS VPN BGP Peer IP Address
- **azure_vpn_bgp_asn (number)**: Azure BGP ASN
- **azure_vpn_bgp_peering_cidr_1 (string)**: Azure VPN BGP CIDR Peer
- **azure_vpn_bgp_peering_cidr_2 (string)**: Azure VPN BGP CIDR Peer
- **azure_vpn_bgp_peering_cidr_3 (string)**: Azure VPN BGP CIDR Peer
- **azure_vpn_bgp_peering_cidr_4 (string)**: Azure VPN BGP CIDR Peer
- **azure_vpn_bgp_peering_address_1 (string)**: Azure VPN BGP Peer IP Address
- **azure_vpn_bgp_peering_address_2 (string)**: Azure VPN BGP Peer IP Address
- **azure_vpn_bgp_peering_address_3 (string)**: Azure VPN BGP Peer IP Address
- **azure_vpn_bgp_peering_address_4 (string)**: Azure VPN BGP Peer IP Address

## Usage
```hcl
module "aws-to-azure-bgp-vpn" {
  source = "git@github.com:dulao5/tf-aws-to-azure-bgp-vpn.git"

  aws_location        = "us-east-1"
  aws_location_prefix = "use1-aws-to-azure-vpn"
  aws_vpc_id          = "vpc-123456789"

  azure_location            = "eastus"
  azure_location_prefix     = "eus-aws-to-azure-vpn"
  azure_resource_group      = "rg-hoge"
  azure_vnet_name           = "vnet-fuga"
  azure_gateway_subnet_cidr = "192.168.254.128/27" # The cidr of the GatewaySubnet must be a subset of the cidr of the vnet
  azure_vpn_gateway_map     = {
    sku        = "VpnGw3"
    generation = "Generation1"
    # see https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways#benchmark
  }
}
```

## Confirmation of Network Connectivity

- aws to azure : no need to configure NSG on azure side
- azure to aws : aws side SG setting is required (Allow access from azure side vnet cidr)