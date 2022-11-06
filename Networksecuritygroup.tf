resource "azurerm_network_security_group" "rg2" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.rg2.location
  resource_group_name = azurerm_resource_group.rg2.name

}

resource "azurerm_network_security_rule" "rd2" {
  resource_group_name         = azurerm_resource_group.rg2.name
  network_security_group_name = azurerm_network_security_group.rg2.name
  name                        = "rdp"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "3389"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}
resource "azurerm_subnet_network_security_group_association" "rg2" {
  subnet_id                 = azurerm_subnet.rg2.id
  network_security_group_id = azurerm_network_security_group.rg2.id
}