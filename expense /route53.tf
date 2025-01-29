resource "aws_route53_record" "expense" {
  count   = length(var.instance_names)
  name    = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}" # if the instance name is frontend, then the name should be domain_name, otherwise it should be instance_name.domain_name
  type    = "A"
  zone_id = var.zone_id
  ttl = 1
  records = var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip] # if the instance name is frontend, then the record should be public_ip, otherwise it should be private_ip
}