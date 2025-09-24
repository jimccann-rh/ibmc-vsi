# IBM Classic VSI (dal10, Red Hat, B1.2x4)

## Prereqs
- Terraform >= 1.4
- IBM Cloud Classic credentials (username + legacy API key)
- Existing SSH keys labeled `ci` and `ci-sshkey-vsi` in Classic Infrastructure

## Configure
Create `terraform.tfvars`:

```hcl
iaas_classic_username = "your@classic.username"
iaas_classic_api_key  = "xxxxx"
project               = "ci"
hostname              = "ci-redhat"
# optional overrides
# datacenter          = "dal10"
# os_reference_code   = "REDHAT_9_64"
# network_speed       = 100
# ssh_key_labels      = ["ci", "ci-sshkey-vsi"]
```

## Run
```bash
terraform -chdir=./ibmc-vsi init
terraform -chdir=./ibmc-vsi apply
```

## Outputs
- `vsi_id`
- `public_ip`
- `private_ip`
