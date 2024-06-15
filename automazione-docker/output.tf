################################
# AUTOMAZIONE CONTAINER DOCKER #
#  FRANCESCO CAPPA (fcappa91)  #
################################

output "container_info" {
  value = {
    for container in docker_container.image : container.name => container.network_data[0].ip_address
  }
}