################################
# AUTOMAZIONE CONTAINER DOCKER #
#  FRANCESCO CAPPA (fcappa91)  #
################################

###################################
# CONFIGURAZIONI
###################################

service_name = "Nome Applicativo"
environment = "development"
container_name_prefix =  "app-name"

###################################
# IMMAGINI DOCKER
###################################

docker_images = {
  php = {
    image                 = "php:5.5-apache"  #immagine docker da utilizzare
    enable_envs           = true              #utilizza variabili d'ambiente
    enable_ports          = true              #port mapping
    enable_volume_mount   = true              #monta volume (bridge)
    enable_command        = false             #esegui comandi personalizzati
    ports                 = {
      internal = 80                           #porta container
      external = 8080                         #porta esposta
    }
    volume_target_path    = "/var/www/html"   #path container
    volume_source_path    = "D:/src/php"      #path assoluto
    env_vars              = ["TEST=ciao"]     #variabili d'ambiente
  }
  node = {
    image                 = "node:16.18.0-alpine"
    enable_envs           = true 
    enable_ports          = true
    enable_volume_mount   = true
    enable_command        = true
    ports                 = {
      internal = 80
      external = 8081
    }
    volume_target_path    = "/var/www/html"
    volume_source_path    = "D:/src/node"
    commands              = ["index.js"]
    env_vars              = ["TEST=ciao"]
  }
  mariadb = {
    image                 = "mariadb"
    enable_envs           = true
    enable_ports          = true
    enable_volume_mount   = false
    enable_command        = false
    ports                 = {
      internal = 3306
      external = 8036
    }
    env_vars              = ["MARIADB_ROOT_PASSWORD=password"]
  }
}