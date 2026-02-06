terraform {
    backend "s3" {
      bucket = "task4-bucket-terraform"
      key = "task4-ec2/terraform.tfstate"
      region = "ap-south-1"
      encrypt = true
    }
}