# setup codespace
```bash
. terraform.sh
. gcloud.sh
. tools.sh
```
#
gcloud auth login
# 
gcloud auth application-default login
#
gcloud config set project <your project ID>
# or
export GOOGLE_CREDENTIALS='{"auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",.......}'