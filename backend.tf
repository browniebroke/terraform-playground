terraform {
    backend "s3" {
        bucket = "browniebroke-terraform-storage"
        encrypt = true
        key = "browniebroke.tfstate"
        region = "eu-west-2"
    }
}
