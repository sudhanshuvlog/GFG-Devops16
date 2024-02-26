# module "my_ec2_module"{
#     source= "./module/ec2/"
#     instanceType = "t3.micro"
# }

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.0"
  bucket = "mygfgbucketbyterraform"
}

output "myoutputfors3"{
    value = module.s3-bucket.s3_bucket_bucket_domain_name
}