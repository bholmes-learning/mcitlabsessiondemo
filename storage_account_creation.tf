#This is an Azure Montreal College Information Technology - Lab Session

resource "azurerm_resource_group" "azureresourcegroup" {
  name     = "bhstorageaccount"
  location = "Canada Central"
}
resource "azurerm_storage_account" "mcitstorageaccount" {
  count=5
  name                     = "${var.firstname}${var.lastname}storage${count.index}"
  resource_group_name      = azurerm_resource_group.azureresourcegroup.name
  location                 = azurerm_resource_group.azureresourcegroup.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier=var.access_tier
  cross_tenant_replication_enabled = var.cross_tenant_replication_enabled
  tags = {
    environment = var.environment
  }
}

