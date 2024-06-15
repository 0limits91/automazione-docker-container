################################
# AUTOMAZIONE CONTAINER DOCKER #
#  FRANCESCO CAPPA (fcappa91)  #
################################

resource "docker_container" "image" {
  for_each = var.docker_images
  name     = "${var.container_name_prefix}-${each.key}"
  image    = each.value.image

  dynamic "ports" {
    for_each = each.value.enable_ports ? [1] : []
    content {
      internal = each.value.enable_ports ? each.value.ports.internal : 0
      external = each.value.enable_ports ? each.value.ports.external : 0
    }
  }

  dynamic "mounts" {
    for_each = each.value.enable_volume_mount ? [1] : []
    content {
      type      = "bind"
      target    = each.value.volume_target_path
      source    = each.value.volume_source_path
      read_only = true
    }
  }
  command = each.value.enable_command ? each.value.commands : [] 
  env = each.value.enable_envs ? each.value.env_vars : []
  working_dir = each.value.volume_target_path
}