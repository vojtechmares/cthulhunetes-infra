resource "cloudflare_zone" "cthulhunetes" {
  account_id = "f24333bb3c47d6db753e57e2a0c90082"
  zone = "cthulhunetes.net"
}

resource "cloudflare_zone_dnssec" "cthulhunetes" {
  zone_id = cloudflare_zone.cthulhunetes.id
}

resource "cloudflare_zone_settings_override" "cthulhunetes" {
  zone_id = cloudflare_zone.cthulhunetes.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_record" "cthulhu_k8s_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "cthulhu.k8s"
  value   = hcloud_load_balancer.mallard.ipv4
  type    = "A"
  proxied = false
}

# Cthulhu nodes DNS records
resource "cloudflare_record" "zebra_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "zebra"
  value   = "23.88.73.182"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "camel_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "camel"
  value   = "116.202.114.83"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "raven_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "raven"
  value   = "168.119.35.142"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "cthulhunetes_wildcard" {
  zone_id = cloudflare_zone.cthulhunetes.id
  name    = "*"
  value   = hcloud_load_balancer.chamois.ipv4
  type    = "A"
  proxied = false
}
