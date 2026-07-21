terraform {

  required_version = ">= 1.7.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.50"
    }

  }

}
terraform {

  required_version = ">= 1.8.0"

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "~> 5.0"

    }

  }

}