# enable secret manager api
#resource google_project_service secretmanager {
#  service  = "secretmanager.googleapis.com"
#}
# create secret
resource google_secret_manager_secret runner-secret {
    secret_id = "runner-secret"
    labels = {
        label = "github-runners"
    }
    
    replication {
        automatic = true
    }
}
# create secret version
resource google_secret_manager_secret_version runner-secret {
  depends_on = [google_secret_manager_secret.runner-secret]
  secret      = google_secret_manager_secret.runner-secret.id
  secret_data = <<-EOF
  REPO_NAME=${var.repoName}
  REPO_OWNER=${var.repoOwner}
  GITHUB_TOKEN=${var.githubToken}
  REPO_URL=${var.repoURL}
  EOF
}
