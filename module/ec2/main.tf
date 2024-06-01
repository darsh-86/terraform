resource "aws_instance" "this_aws_instance" {
  ami                    = var.this_aws_instance_ami
  instance_type          = var.this_aws_instance_instance_type
  key_name               = var.this_aws_instance_key_name
  vpc_security_group_ids = [var.this_aws_instance_sg_id]
  availability_zone      = var.this_aws_instance_availability_zone
  subnet_id              = var.this_aws_instance_subnet
  root_block_device {
    volume_size = var.this_aws_instance_volume_size
  }
  count = var.this_aws_instance_count

  user_data = <<-EOF
            #!/bin/bash
    sudo -i
    EOF

  tags = {
    Name = var.this_aws_instance_tags
  }
}
