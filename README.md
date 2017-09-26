# Infrastructure for geowa4.software

Manages the infrastructure for [https://geowa4.software](https://geowa4.software).

## Prerequisites

 - [Terraform](https://www.terraform.io) 0.10.6 or greater.
 - Environment variables:
    - `CLOUDFLARE_EMAIL`
    - `CLOUDFLARE_TOKEN`
    - `GITHUB_TOKEN`
    - `GITHUB_ORGANIZATION`

## Running

```
terraform init
terraform plan
terraform apply
```

