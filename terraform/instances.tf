resource "aws_key_pair" "key" {
  key_name   = "coffeeweb_keys"
  public_key = file("~/.ssh/aws.pub")
}
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"

  # using default VPC
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress {
    description = "TLS from VPC"

    # we should allow incoming and outoging
    # TCP packets
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    # allow all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

#nat Instance
module "foundation_ec2-nat-instances" {
  source  = "fpco/foundation/aws//modules/ec2-nat-instances"
  version = "0.9.16"
  # insert the 5 required variables here
  key_name = coffeeweb_keys
  name_prefix = coffeeweb_nat
  public_subnet_ids = [subnet-022c01ce29984d0b3 , subnet-0b7cadb3921c77f39]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24" ]
  security_group_ids = aws_security_group.allow_ssh.id
}

# key_name string
# Description: name of SSH key, maps to NAT instance `key_name`
# name_prefix string
# Description: Prefix for naming resources, usually project-related
# private_subnet_cidrs list(string)
# Description: CIDRs of private subnets for iptables configuration
# public_subnet_ids list(string)
# Description: list of IDs for subnets to deploy the NAT instances into
# security_group_ids list(string)
# Description: list of security groups to associate with the NAT instance

#Ubuntu Instances
