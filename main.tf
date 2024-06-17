################################
# AUTOMAZIONE CONTAINER DOCKER #
#  FRANCESCO CAPPA (fcappa91)  #
################################

locals {
  app_name_prefix = "${var.container_name_prefix}-${var.environment}-${substr(uuidv5("oid", var.container_name_prefix), 0, 5)}"
}

module "infra" {
  source = "./automazione-docker"
  
  service_name = var.service_name
  container_name_prefix = local.app_name_prefix
  docker_images = var.docker_images
  environment = var.environment
}


