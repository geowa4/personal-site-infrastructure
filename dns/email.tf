resource "cloudflare_record" "fastmail" {
  domain = "${var.domain}"
  type   = "CNAME"
  name   = "${element(var.fastmail_subdomains, count.index)}._domainkey"
  value  = "${element(var.fastmail_subdomains, count.index)}.${var.domain}.dkim.fmhosted.com"
  count  = "${length(var.fastmail_subdomains)}"
}

resource "cloudflare_record" "mx" {
  domain   = "${var.domain}"
  type     = "MX"
  name     = "@"
  value    = "in${count.index + 1}-smtp.messagingengine.com"
  priority = "${(count.index + 1) * 10}"
  count    = 2
}

resource "cloudflare_record" "mx_wildcard" {
  domain   = "${var.domain}"
  type     = "MX"
  name     = "*"
  value    = "in${count.index + 1}-smtp.messagingengine.com"
  priority = "${(count.index + 1) * 10}"
  count    = 2
}

resource "cloudflare_record" "sparkpost_send" {
  domain = "${var.domain}"
  type   = "TXT"
  name   = "scph0917._domainkey"
  value  = "v=DKIM1; k=rsa; h=sha256; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCqFOe1EXQ3p7na5Q8OsfRb7eGNsXjoPu+J5yaQ/uOtNe7ujc8lcwmCyoSbtcgvK8R2rsvr9PE5TBHPFjo1riTt7GR9AwIcIItyR+WNHWvXFQy+w7AQ7pMS7r+dmRAUovY/c6klYUiz0VG6PQWrizVKVGFD5FTUWnQUEqITzS06FwIDAQAB"
}

resource "cloudflare_record" "sparkpost_bounce" {
  domain = "${var.domain}"
  type   = "TXT"
  name   = "scph0917._domainkey.bounces"
  value  = "v=DKIM1; k=rsa; h=sha256; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCsRzEVcOmDuMdjcvCz4XTdxwuXhx7qs9PFHRR2WU8bwfwCLO3nCC5AMdHRMeby3YDH6XqEYIfiw+89cnJR4FA3kY5wr8wQgofNrO68bU0iPoMV4UQb6g1DJ19poUqiRSlEYcpTxkTwbizJEi/smk7EKrQdQJNEqqNSAckpTc9ipQIDAQAB"
}

resource "cloudflare_record" "sparkpost_bounce_alias" {
  domain = "${var.domain}"
  type   = "CNAME"
  name   = "bounces"
  value  = "sparkpostmail.com"
}
