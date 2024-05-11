resource "aws_route53_record" "expense" {
  for_each = aws_instance.expense
  zone_id = var.instance_name
  name    = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  #name = local.record_name
  type    = "A"
  ttl     = 300
  records = each.key == frontend ? [each.value.public_ip] : [each.value.private_ip]
  # count and count.index won't work in locals
  #records = local.record_value
  allow_overwrite = true
}