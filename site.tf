provider "github" {}
provider "cloudflare" {}

resource "github_repository" "site_repo" {
  name         = "geowa4.github.io"
  description  = "My site."
  homepage_url = "https://geowa4.software"
  has_issues   = true
  private      = false
}

module "dns" {
  source = "./dns"
}
