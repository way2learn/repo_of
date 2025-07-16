// Terraform OneFuse Provider
terraform {
  required_providers {
    onefuse = {
      source  = "CloudBoltSoftware/onefuse"
      version = ">= 1.40.0"
   }
  }
  required_version = ">= 0.13"
}

// Inititalize OneFuse Provider
provider "onefuse" {
  scheme     = var.onefuse_scheme
  address    = var.onefuse_address
  port       = var.onefuse_port
  user       = var.onefuse_user
  password   = var.onefuse_password
  verify_ssl = var.onefuse_verify_ssl
}


// Data Source for Naming Policy - lookup Policy ID by Policy Name
data "onefuse_naming_policy" "naming_policy" {
  name = var.test_param2  // Replace with Policy Name
}

// Resource for Naming
resource "onefuse_naming" "my_name" {
  naming_policy_id        = data.onefuse_naming_policy.naming_policy.id      // Refers to Data Source to get Policy ID
  workspace_id            = "/api/v3/onefuse/workspaces/2/"
  template_properties     = var.template_properties
  dns_suffix              = "example.com"
}

// Outputs for Resource
output "name" {
  value = onefuse_naming.my_name.name
}

output "dns_suffix" {
  value = onefuse_naming.my_name.dns_suffix
}
