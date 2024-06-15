################################
# AUTOMAZIONE CONTAINER DOCKER #
#  FRANCESCO CAPPA (fcappa91)  #
################################

locals {
  app_name_prefix = "${var.container_name_prefix}-${var.environment}-${random_id.container_id.hex}"
}

module "infra" {
  source = "./automazione-docker"  
  service_name = var.service_name
  container_name_prefix = local.app_name_prefix
  docker_images = var.docker_images
  environment = var.environment
}


