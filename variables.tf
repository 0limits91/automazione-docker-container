################################
# AUTOMAZIONE CONTAINER DOCKER #
#  FRANCESCO CAPPA (fcappa91)  #
################################

variable service_name {
  type        = string
  default     = ""
  description = "Nome del servizio"
}

variable "container_name_prefix" {
  type = string
}

resource "random_id" "container_id" {
  byte_length = 8
}

variable "environment" {
  description = "Variabile che identifica l'ambiente (es. dev, staging, prod)"
  type        = string
}

variable "docker_images" {
  type = map(object({
    image                 = string
    enabled               = bool
    enable_envs           = bool
    enable_ports          = bool
    enable_volume_mount   = bool
    enable_command        = bool
    ports                 = optional(object({
      internal = number
      external = number
    }))
    volume_target_path    = optional(string)
    volume_source_path    = optional(string)
    commands              = optional(list(string))
    env_vars              = optional(list(string))
  }))
  default = {}
}