resource "aws_route53_record" "expense" {
  for_each = aws_instance.expense
  name     = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  # if the instance name is frontend, then the record should be domain_name, otherwise it should be instance_name.domain_name
  type     = "A"
  zone_id  = var.zone_id
  ttl      = 1
  records  = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
  # if the instance name is frontend, then the record should be public_ip, otherwise it should be private_ip
  allow_overwrite = true
}