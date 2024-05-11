resource "aws_route53_record" "expense" {
  count = length(var.instance_name)
  zone_id = var.instance_name
  name    = var.instance_name[count.index] == "frontend" ? var.domain_name : "${var.instance_name[count.index]}.${var.domain_name}"
  #name = local.record_name
  type    = "A"
  ttl     = 300
  #records = var.instance_name[count.index] == frontend ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
  # count and count.index won't work in locals
  records = local.record_value
  allow_overwrite = true
}