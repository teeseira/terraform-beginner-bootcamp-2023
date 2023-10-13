terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
#  cloud {
#    organization = "tm2entity"
#
#    workspaces {
#      name = "terra-house-1"
#    }
#  }
}
provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "Avatar: The Game!"
  description = <<DESCRIPTION
"Avatar: The Game" is an action-adventure video game.  Set on the visually stunning world of Pandora, players can choose to play as human soldiers or Na'vi, each offering distinct gameplay experiences. The game combines exploration, interaction with the planet's wildlife, and thrilling battles, providing an opportunity to delve into the rich world of Pandora while enjoying an original storyline that complements the movie's narrative.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  town = "missingo"
  content_version = 1
}