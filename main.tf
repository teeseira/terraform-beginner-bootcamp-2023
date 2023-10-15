terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  cloud {
    organization = "tm2entity"

    workspaces {
      name = "terra-house-1"
    }
  }
}









provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_avatar_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.avatar.public_path
  content_version = var.avatar.content_version
}

resource "terratowns_home" "home" {
  name = "Avatar: The Game!"
  description = <<DESCRIPTION
"Avatar: The Game" is an action-adventure video game.  Set on the visually stunning world of Pandora, players can choose to play as human soldiers or Na'vi, each offering distinct gameplay experiences. The game combines exploration, interaction with the planet's wildlife, and thrilling battles, providing an opportunity to delve into the rich world of Pandora while enjoying an original storyline that complements the movie's narrative.
DESCRIPTION
  domain_name = module.home_avatar_hosting.domain_name
  town = "gamers-grotto"
  content_version = var.avatar.content_version
}




module "home_success_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.success.public_path
  content_version = var.success.content_version
}

resource "terratowns_home" "home_success" {
  name = "Recipe for Success"
  description = <<DESCRIPTION
"Regardless of how you personally define a successful life, it's your continuous self-improvement that gives purpose to your accomplishments."
DESCRIPTION
  domain_name = module.home_success_hosting.domain_name
  town = "cooker-cove"
  content_version = var.success.content_version
}
