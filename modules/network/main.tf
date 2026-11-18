resource "azurerm_virtual_network" "my-vnet" {
  name = var.vnet_name
  resource_group_name = var.rg_name
  location = var.loc_name
  address_space = var.vnet_address_spaces
}

resource "azurerm_subnet" "mysubnet" {
  name = var.subnet_name
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.my-vnet.name
  address_prefixes = var.subnet_prefixes
}

resource "azurerm_public_ip" "mypub" {
  name = var.pubip_name
  resource_group_name = var.rg_name
  location = var.loc_name
  allocation_method = "Static"
}

resource "azurerm_network_security_group" "my-nsg" {
  name = var.nsg_name
  resource_group_name = var.rg_name
  location = var.loc_name
  security_rule {
    name = "ssh-rule"
    priority = 100
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name = "http-rule"
    priority = 200
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "80"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name = "https-rule"
    priority = 300
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "443"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "myniccard" {
  name = var.nic_card_name
  resource_group_name = var.rg_name
  location = var.loc_name
  ip_configuration {
    name = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id = azurerm_subnet.mysubnet.id
  }
}

resource "azurerm_network_interface_security_group_association" "my-nicnsg" {
  network_interface_id = azurerm_network_interface.myniccard.id
  network_security_group_id = azurerm_network_security_group.my-nsg.id
}