variable resource_groups {
   type        = map(string)
   description = "The resource groups to deploy"
 }
    
 variable "prefix" {
   type        = string
   description = "A prefix for all resources"
   default     = "rary-prefix-"
 }
    
 variable "region" {
   type        = string
   default     = "West US 2"
   description = "The Azure region to deploy resources"
   validation {
     condition     = contains(["West US 3", "West US 2", "West US"], var.region)
     error_message = "Invalid region"
   }
 }
    
 variable "tags" {
   type        = map(any)
   description = "A map of tags"
 }

variable "virtual_networks" {
   type = map(object({
     name               = string
     resource_group_key = string
     address_space      = list(string)
     subnets = map(object({
       name           = optional(string)
       address_prefix = string
     }))
   }))
   description = "The virtual networks to deploy"
}