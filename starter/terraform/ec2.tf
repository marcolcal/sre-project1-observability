#  module "project_ec2" {
#    source             = "./modules/ec2"
#    name               = local.name
#    account            = data.aws_caller_identity.current.account_id
#    aws_ami            = data.aws_ami.amazon_linux_2.id
#    private_subnet_ids = module.vpc.private_subnet_ids
#    vpc_id             = module.vpc.vpc_id
#  }

  module "project_ec2" {
   source             = "./modules/ec2"
   name               = local.name
   account            = data.aws_caller_identity.current.account_id
   aws_ami            = "ami-0360225d02a33beb2"
   private_subnet_ids = module.vpc.private_subnet_ids
   vpc_id             = module.vpc.vpc_id
 }


#aws ec2 create-restore-image-task --object-key ami-08dff635fabae32e7.bin --bucket udacity-srend --name "udacity-course1-ami-image1"
#    "ImageId": "ami-0360225d02a33beb2"
# aws ec2 copy-image --source-image-id ami-0360225d02a33beb2 --source-region us-east-1 --region us-east-2 --name "udacity-marcoalfaro"
#    "ImageId": "ami-0f0ec3b59f04f5a80"
