# Terraform Playground

Setting up a Terraform repo containing required components for a Dockerized application in AWS.

## Setup

1. The Terraform state is stored in S3 (see `backend.tf` for bucket details). The S3 bucket needs to be created manually ([source](https://dev.to/iamstej/protecting-your-terraform-state-6gn)):
   - In the management console AWS, under S3, create bucket
   - Choose a name and region
   - Tick the checkbox "Versioning (Keep all versions of an object in the same bucket.)"
   - Ensure "Block Public Access" is selected (it should be by default)
2. CI on GitHub actions plans infra changes and deploy automatically, but you'll need to create a user for it. Permissions need to be refined for that user.
