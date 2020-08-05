# template
resource google_compute_instance_template gh-runner-template {
  name_prefix  = "gh-runner-template-"
  #name        = "gh-runner-template"
  description = "This template is used to create runner server instances."

  instance_description = "github-runners"
  machine_type         = "n1-standard-4"
  can_ip_forward       = false

  disk {
    source_image = "ubuntu-os-cloud/ubuntu-1804-lts"
    auto_delete  = true
    boot         = true
    type         = "pd-ssd"
  }
  network_interface {
    network = var.network
    access_config {
    }
  }
  lifecycle {
    create_before_destroy = true
  }
 metadata = {
    startup-script = file("${path.module}/scripts/startup.sh")
    shutdown-script = "${file("${path.module}/scripts/shutdown.sh")}"
 }
  service_account {
    email = google_service_account.gce-runner-sa.email
    scopes = ["cloud-platform"]
  }
}

# instance group

resource google_compute_instance_group_manager runner-group {
  name               = "instance-group-manager"
  base_instance_name = "gce-runner"
  zone               = var.zone
  target_size        = var.runners
  version {
    instance_template  = google_compute_instance_template.gh-runner-template.id
  }

}
