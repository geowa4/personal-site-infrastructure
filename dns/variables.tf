variable "domain" {
  type    = "string"
}

variable "site_ips" {
  type = "list"

  default = [
    "192.30.252.153",
    "192.30.252.154",
  ]
}

variable "blog_ips" {
  type = "list"

  default = [
    "52.0.16.118",
    "52.1.119.170",
    "52.1.147.205",
    "52.1.173.203",
    "52.4.145.119",
    "52.4.175.111",
    "52.4.225.124",
    "52.4.240.221",
    "52.4.38.70",
    "52.5.181.79",
    "52.6.3.192",
    "52.6.46.142",
  ]
}

variable "fastmail_subdomains" {
  type = "list"

  default = [
    "mesmtp",
    "fm1",
    "fm2",
    "fm3",
  ]
}
