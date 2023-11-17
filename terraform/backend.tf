terraform {
  backend "s3" {
    bucket = "cthulhunetes--terraform-state"
    key    = "terraform.tfstate"
    region = "eu-west-1"
    encrypt        = true
    kms_key_id     = "alias/cthulhunetes-key"
    dynamodb_table = "cthulhunetes--terraform-state"
  }
}
