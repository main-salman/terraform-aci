
variable "tenant" {
  type        = string
  description = "Tenant name"
  default = "salman-tenant"
}

variable "app" {
  type        = string
  description = "App name"
  default = "salman-app"
}

variable "epglist" {
  type        = list(string)
  description = "EPG names"
  default     = ["EPG1", "EPG2", "EPG3"]
}
