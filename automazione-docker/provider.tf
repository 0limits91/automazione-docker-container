################################
# AUTOMAZIONE CONTAINER DOCKER #
#  FRANCESCO CAPPA (fcappa91)  #
################################

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
    google = {
      source = "hashicorp/google"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}