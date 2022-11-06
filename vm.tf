resource "azurerm_windows_virtual_machine" "rg2" {
  count                 = 5
  name                  = "test${count.index}"
  resource_group_name   = azurerm_resource_group.rg2.name
  location              = azurerm_resource_group.rg2.location
  size                  = "Standard_b2s"
  network_interface_ids = [element(azurerm_network_interface.rg2.*.id, count.index)]
  admin_username        = "administrator23"
  admin_password        = "Start123!Start123!"

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}