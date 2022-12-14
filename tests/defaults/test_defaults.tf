provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  alias  = "oregon"
  region = "us-west-2"
}

provider "aws" {
  alias  = "singapore"
  region = "ap-southeast-1"
}

module "vpc_peering" {
  source = "../.."
  providers = {
    aws.requester = aws.oregon
    aws.accepter  = aws.singapore
  }

  name             = "oregon-to-singapore"
  requester_vpc_id = "vpc-xxxxxxx"
  accepter_vpc_id  = "vpc-xxxxxxx"
}
