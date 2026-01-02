resource "azurerm_network_interface" "nic" {
  name                = "vm-nic"
  location            = "eastus2"
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = "demo-vm"
  resource_group_name = var.resource_group_name
  location            = "eastus2"
  size                = "Standard_D2ls_v5"

  admin_username = "rootuser"
  admin_password = "Manojkumar00"

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}