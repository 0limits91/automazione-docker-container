################################
# AUTOMAZIONE CONTAINER DOCKER #
#  FRANCESCO CAPPA (fcappa91)  #
################################

resource "docker_container" "image" {
  for_each = {
    for key, value in var.docker_images : key => value
    if value.enabled
  }
  name                  = "${var.container_name_prefix}-${each.key}"
  image                 = each.value.image
  must_run              = true

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

  lifecycle {
    ignore_changes = [
      bridge,
      command,
      container_logs,
      cpu_shares,
      dns_opts,
      dns_search,
      entrypoint,
      exit_code,
      group_add,
      hostname,
      image,
      init,
      ipc_mode,
      log_opts,
      max_retry_count,
      memory,
      network_data,
      network_mode,
      privileged,
      publish_all_ports,
      runtime,
      security_opts,
      shm_size,
      stop_signal,
      stop_timeout,
      storage_opts,
      sysctls,
      tmpfs
    ]
  }

}