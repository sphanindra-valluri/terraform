resource "aws_route53_record" "www" {
  count = 10
  zone_id = var.zone_id
  # interpolation
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     =  1
  records = [aws_instance.roboshop[count.index].private_ip]
}

# roboshop.phani.fun -> public_ip
# As part of functions
resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  # interpolation
  name    = "roboshop.${var.domain_name}"
  type    = "A"
  ttl     =  1
  records = [aws_instance.roboshop[index(var.instances, "frontend")].public_ip]
}