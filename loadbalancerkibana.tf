# Create a new load balancer
resource "aws_elb" "bar" {
  name               = "elb-kibana"
  availability_zones = ["us-east-1a"]

  
  listener {
    instance_port     = 5601
    instance_protocol = "http"
    lb_port           = 5601
    lb_protocol       = "http"
  }

  
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:5601"
    interval            = 30
  }

#Necessário capturar as informações na console
  instances                   = ["i-0ec114b1e29bd005b","i-08de1c6b63e8318bc","i-01cdf65eec3818f93"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "elb-kibana"
  }
}
