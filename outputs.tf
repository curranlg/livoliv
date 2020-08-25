########## Output the RDS DB connection endpoint
#output "rds_endpoint" {
#  description = "The MySQL DB Connection Endpoint:"
#  value = "${aws_db_instance.rdsmysql.endpoint}"
#}

########## Output the LB DNS Name
#output "elb_dns" {
#  description = "The Elastic Laod Balancer DNS Name:"
#  value = "${aws_lb.ELB-Ext1.dns_name}"
#}