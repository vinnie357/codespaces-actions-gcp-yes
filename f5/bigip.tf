
data http pubKeys {
    url = "https://github.com/${var.gitUser}.keys"
}

resource random_pet buildSuffix {
  keepers = {
    # Generate a new pet name each time we switch to a new AMI id
    #ami_id = "${var.ami_id}"
    prefix = var.projectPrefix
  }
  # length in names not characters...
  length = 1
  separator = "-"
}

resource random_password password {
  length           = 16
  special          = true
  override_special = " #%*+,-./:=?@[]^_~"
}

module bigip {
  source = "github.com/vinnie357/terraform-gcp-bigip?ref=master"
  #====================#
  # BIG-IP settings    #
  #====================#
  gceSshPubKey = data.http.pubKeys.body
  projectPrefix = var.projectPrefix
  buildSuffix = "-${random_pet.buildSuffix.id}"
  adminSrcAddr = var.adminSrcAddr
  adminPass = random_password.password.result
  adminAccountName = var.adminAccountName
  mgmtVpc = google_compute_network.vpc_network_mgmt
  intVpc = google_compute_network.vpc_network_int
  extVpc = google_compute_network.vpc_network_ext
  mgmtSubnet = google_compute_subnetwork.vpc_network_mgmt_sub
  intSubnet = google_compute_subnetwork.vpc_network_int_sub
  extSubnet = google_compute_subnetwork.vpc_network_ext_sub
  serviceAccounts = var.serviceAccounts
  instanceCount = 1
  customImage = ""
  customUserData = ""
  bigipMachineType = "n1-standard-8"
}