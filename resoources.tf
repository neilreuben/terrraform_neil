#resource "google_compute_network" "Our_development_network" {
#	name = "devnetwork"
#	auto_create_subnetworks =true
#}

resource "aws_vpc" "environment-example-two" {
	cidr_block = "10.0.0.0/16"
	enable_dns_hostnames = true
	enable_dns_support = true
   tags = {
	   Name = "terraform-aws-vpc-exampe-2"
	}
}

resource "aws_subnet" "subnet1" {
	cidr_block = "${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 3, 1}"
	vpc_id = "${aws_vpc.environment-example-two.id}"
	availability_zone = "us-west-2a"
}
