provider "cloudflare" {}

module "dns" {
  source = "./dns"
}
