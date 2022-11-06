# Create a Recource Group 
resource "azurerm_resource_group" "rg2" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_virtual_network" "rg2" {
  name                = "rg2-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg2.location
  resource_group_name = azurerm_resource_group.rg2.name
}
resource "azurerm_subnet" "rg2" {
  name                 = "Testservers"
  resource_group_name  = azurerm_resource_group.rg2.name
  virtual_network_name = azurerm_virtual_network.rg2.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "rg2" {
  count               = 5
  name                = "networktest${count.index}"
  location            = azurerm_resource_group.rg2.location
  resource_group_name = azurerm_resource_group.rg2.name


  ip_configuration {
    name                          = "Testservers"
    subnet_id                     = azurerm_subnet.rg2.id
    private_ip_address_allocation = "Dynamic"
  }
}




