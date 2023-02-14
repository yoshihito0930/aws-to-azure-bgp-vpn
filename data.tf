// Azure resurces
data "azurerm_resource_group" "main" {
  name     = var.azure_resource_group
}

data "azurerm_virtual_network" "main" {
  name                = var.azure_vnet_name
  resource_group_name = var.azure_resource_group
}

# data "azurerm_subnet" "main" {
#   name                 = var.azure_main_subnet_name
#   virtual_network_name = data.azurerm_virtual_network.main.name
#   resource_group_name  = var.azure_resource_group
# }
# 
# data "azurerm_subnet" "gateway" {
#   name                 = var.azure_gateway_subnet_name
#   virtual_network_name = data.azurerm_virtual_network.main.name
#   resource_group_name  = var.azure_resource_group
# }

data "azurerm_public_ip" "main_1" {
  name                = azurerm_public_ip.main_1.name
  resource_group_name = azurerm_public_ip.main_1.resource_group_name
  depends_on = [
    azurerm_virtual_network_gateway.main
  ]
}

data "azurerm_public_ip" "main_2" {
  name                = azurerm_public_ip.main_2.name
  resource_group_name = azurerm_public_ip.main_2.resource_group_name
  depends_on = [
    azurerm_virtual_network_gateway.main
  ]
}




// AWS 

// VPC
data "aws_vpc" "main" {
  id = var.aws_vpc_id
}

// route tables
data "aws_route_tables" "rts" {
  vpc_id = var.aws_vpc_id
  #filter {
  #  name   = "association.subnet-id"
  #  values = ["subnetids"]
  #}
}