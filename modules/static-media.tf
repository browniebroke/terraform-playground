module "static_media" {
  for_each = toset(["static", "media"])
  source   = "./bucket-cloudfront"

  origin_name = each.key
  bucket_name = "browniebroke-${each.key}"
}
