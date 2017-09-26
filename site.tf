provider "github" {}
provider "cloudflare" {}

variable "site_domain" {
  type = "string"
  default = "geowa4.software"
}

resource "github_repository" "site_repo" {
  name         = "geowa4.github.io"
  description  = "My site."
  homepage_url = "https://${var.site_domain}"
  has_issues   = true
  private      = false
}

module "dns" {
  source = "./dns"
  domain = "${var.site_domain}"
}
