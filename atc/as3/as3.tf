  
provider bigip {
  address = "https://${var.mgmt}"
  username = var.adminUsername
  password = var.password
}


#application services 3 template
data template_file as3_json {
  template = "${file("as3.json.tpl")}"
  vars ={
      uuid = "${uuid()}"
      publicvip  = var.extVip
      privatevip = var.privateVip
  }
}
#application services 3 template
resource bigip_as3  as3-apm {
     as3_json = data.template_file.as3_json.rendered
}

variable mgmt {
  description = "bigip mgmt addr"
}
variable adminUsername {

}
variable password {}
variable extVip {}
variable privateVip {}