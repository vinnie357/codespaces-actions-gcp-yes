resource google_service_account gce-runner-sa {
  account_id   = "gce-runner-sa"
  display_name = "runner service account for secret access"
}
# add service account read permissions to secret
resource google_secret_manager_secret_iam_member gce-runner-sa-iam {
  depends_on = [google_service_account.gce-runner-sa]
  secret_id = google_secret_manager_secret.runner-secret.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.gce-runner-sa.email}"
}