terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }

    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "4.19.0"
    }

    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.44.1"
    }
  }
}

provider "aws" {
  region     = "eu-west-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "cloudflare" {
  api_key = var.cloudflare_api_key
  email = var.cloudflare_email
}

provider "hcloud" {
  token = var.hcloud_token
}

variable "aws_access_key" {
  type = string
  sensitive = true
}

variable "aws_secret_key" {
  type = string
  sensitive = true
}

variable "cloudflare_api_key" {
  type = string
  sensitive = true
}

variable "cloudflare_email" {
  type = string
}

variable "hcloud_token" {
  type = string
  sensitive = true
}


