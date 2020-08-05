```bash
project="myproject"
admin="myadmin"
pass='mypass'

name=$(gcloud compute instances list --filter name:code-spaces --format json |jq -r .[0].name)
extMgmt=$(gcloud compute instances list --filter name:$name --format json | jq .[0].networkInterfaces | jq -r .[1].accessConfigs[0].natIP)
intMgmt=$(gcloud compute instances list --filter name:$name --format json | jq .[0].networkInterfaces | jq -r .[0].networkIP)
extVip=$(gcloud compute instances list --filter name:$name --format json | jq .[0].networkInterfaces | jq -r .[0].accessConfigs[0].natIP)
privateVip=$(gcloud compute instances list --filter name:$name --format json | jq .[0].networkInterfaces | jq -r .[0].networkIP)
```
```bash
terraform apply -var="mgmt="${extMgmt}"" -var="adminUsername="${admin}"" -var="password="${pass}"" -var="extVip="${extVip}"" -var="privateVip="${privateVip}""

terraform destroy -var="mgmt="${extMgmt}"" -var="adminUsername="${admin}"" -var="password="${pass}"" -var="extVip="${extVip}"" -var="privateVip="${privateVip}""
```