# gcp
variable project { 
    description = "my projectID"
}
variable region { 
    description = "region to deploy resources in"
}
variable zone { 
    description = "zone to deploy resources in"
}
# admin
variable adminSrcAddr {
  description = "admin source range in CIDR"

}
variable adminAccountName { 
    description = "big-ip admin account name"
    default = "notadmin"
}
# bigip
variable projectPrefix {
    description = "prefix for project items"
    default = "code-spaces-"
}
variable serviceAccounts {
  type = map
  default = {
      storage = "default-compute@developer.gserviceaccount.com"
      compute = "default-compute@developer.gserviceaccount.com"
    }
}
# git
variable gitUser {
    description = "get user to get public keys from"
}