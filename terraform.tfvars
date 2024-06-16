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
    image                 = "php:8.3-apache"  #immagine docker da utilizzare
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
    image                 = "node:20.14.0-alpine3.20"
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
      external = 8306
    }
    env_vars              = ["MARIADB_ROOT_PASSWORD=password"]
  }
  postgres = {
    image                 = "postgres"
    enable_envs           = true
    enable_ports          = true
    enable_volume_mount   = false
    enable_command        = false
    ports                 = {
      internal = 5432
      external = 8432
    }
    env_vars              = ["POSTGRES_PASSWORD=password"]
  }
  mongodb = {
    image                 = "mongo"
    enable_envs           = true
    enable_ports          = true
    enable_volume_mount   = false
    enable_command        = false
    ports                 = {
      internal = 27017
      external = 8017
    }
    env_vars              = ["MONGO_INITDB_ROOT_USERNAME=username", "MONGO_INITDB_ROOT_PASSWORD=password"]
  }
  redis = {
    image                 = "redis"
    enable_envs           = false
    enable_ports          = true
    enable_volume_mount   = false
    enable_command        = false
    ports                 = {
      internal = 6379
      external = 8379
    }
  }
}