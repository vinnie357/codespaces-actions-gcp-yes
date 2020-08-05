provider bigip {
  address = "https://${var.mgmt}"
  username = var.adminUsername
  password = var.password
}

#Declarative Onboarding template 01
data template_file vm01_do_json {
  template = file("${path.module}/do.json.tpl")

  vars = {
    hostName      = var.hostName
    dns_server	  = "8.8.8.8"
    ntp_server	  = "0.us.pool.ntp.org"
    timezone	    = "UTC"
  }
}

resource bigip_do  do {
     do_json = data.template_file.vm01_do_json.rendered
}

variable mgmt {
  description = "bigip mgmt addr"
}
variable hostName {
  description = "bigip hostname"
}
variable adminUsername {

}
variable password {}