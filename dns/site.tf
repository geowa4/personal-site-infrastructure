resource "cloudflare_record" "site" {
  domain  = "${var.domain}"
  type    = "A"
  name    = "@"
  value   = "${element(var.site_ips, count.index)}"
  proxied = true
  count   = "${length(var.site_ips)}"
}

resource "cloudflare_record" "site_www" {
  domain  = "${var.domain}"
  type    = "A"
  name    = "www"
  value   = "${element(var.site_ips, count.index)}"
  proxied = true
  count   = "${length(var.site_ips)}"
}

resource "cloudflare_record" "blog" {
  domain  = "${var.domain}"
  type    = "A"
  name    = "blog"
  value   = "${element(var.blog_ips, count.index)}"
  proxied = true
  count   = "${length(var.blog_ips)}"
}

resource "cloudflare_record" "keybase" {
  domain = "${var.domain}"
  type   = "TXT"
  name   = "@"
  value  = "keybase-site-verification=_29hu-ki59HQxni1r1iGCpXXikYZbbsWLdGMYcPE07g"
}
