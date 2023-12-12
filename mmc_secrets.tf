## <https://www.terraform.io/docs/providers/azurerm/index.html> 
provider "azurerm" {
  version = "=2.5.0"
  features {}
}

## <https://www.terraform.io/docs/providers/azurerm/r/resource_group.html>
resource "azurerm_resource_group" "rg" {
  name     = "TerraformTesting"
  location = "eastus"
  tags = {
    yor_trace            = "25f69b44-1a6c-45dc-8243-2acb9151901f"
    git_commit           = "b2fb7c4e142d9d9e86c331f47f532a319d9b339c"
    git_file             = "mmc_secrets.tf"
    git_last_modified_at = "2023-05-01 06:53:06"
    git_last_modified_by = "87660195+sreerajnair95@users.noreply.github.com"
    git_modifiers        = "87660195+sreerajnair95"
    git_org              = "sreerajnair95"
    git_repo             = "sreerajnair95"
    yor_name             = "rg"
    nikhil               = "owneremail.address.test.com"
  }
}

## <https://www.terraform.io/docs/providers/azurerm/r/availability_set.html>
resource "azurerm_availability_set" "DemoAset" {
  name                = "example-aset"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    yor_trace            = "cb7b0ddd-b38f-48cf-b512-ff5c1141bae1"
    git_commit           = "b2fb7c4e142d9d9e86c331f47f532a319d9b339c"
    git_file             = "mmc_secrets.tf"
    git_last_modified_at = "2023-05-01 06:53:06"
    git_last_modified_by = "87660195+sreerajnair95@users.noreply.github.com"
    git_modifiers        = "87660195+sreerajnair95"
    git_org              = "sreerajnair95"
    git_repo             = "sreerajnair95"
    yor_name             = "DemoAset"
    nikhil               = "owneremail.address.test.com"
  }
}

## <https://www.terraform.io/docs/providers/azurerm/r/virtual_network.html>
resource "azurerm_virtual_network" "vnet" {
  name                = "vNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    yor_trace            = "c999f24e-e230-4ab3-a8dd-ce386069066b"
    git_commit           = "b2fb7c4e142d9d9e86c331f47f532a319d9b339c"
    git_file             = "mmc_secrets.tf"
    git_last_modified_at = "2023-05-01 06:53:06"
    git_last_modified_by = "87660195+sreerajnair95@users.noreply.github.com"
    git_modifiers        = "87660195+sreerajnair95"
    git_org              = "sreerajnair95"
    git_repo             = "sreerajnair95"
    yor_name             = "vnet"
    nikhil               = "owneremail.address.test.com"
  }
}

## <https://www.terraform.io/docs/providers/azurerm/r/subnet.html> 
resource "azurerm_subnet" "subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = "10.0.2.0/24"
}

## <https://www.terraform.io/docs/providers/azurerm/r/network_interface.html>
resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    yor_trace            = "291a5840-3d43-4005-adce-4360d8690f80"
    git_commit           = "b2fb7c4e142d9d9e86c331f47f532a319d9b339c"
    git_file             = "mmc_secrets.tf"
    git_last_modified_at = "2023-05-01 06:53:06"
    git_last_modified_by = "87660195+sreerajnair95@users.noreply.github.com"
    git_modifiers        = "87660195+sreerajnair95"
    git_org              = "sreerajnair95"
    git_repo             = "sreerajnair95"
    yor_name             = "example"
    nikhil               = "owneremail.address.test.com"
  }
}

## <https://www.terraform.io/docs/providers/azurerm/r/windows_virtual_machine.html>
resource "azurerm_windows_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  availability_set_id = azurerm_availability_set.DemoAset.id
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  tags = {
    yor_trace            = "a8077e3a-f8e6-4b2c-83be-5dba53acbed8"
    git_commit           = "b2fb7c4e142d9d9e86c331f47f532a319d9b339c"
    git_file             = "mmc_secrets.tf"
    git_last_modified_at = "2023-05-01 06:53:06"
    git_last_modified_by = "87660195+sreerajnair95@users.noreply.github.com"
    git_modifiers        = "87660195+sreerajnair95"
    git_org              = "sreerajnair95"
    git_repo             = "sreerajnair95"
    yor_name             = "example"
    nikhil               = "owneremail.address.test.com"
  }
}
