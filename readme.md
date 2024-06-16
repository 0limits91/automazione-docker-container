````
################################
# AUTOMAZIONE CONTAINER DOCKER #
#  FRANCESCO CAPPA (fcappa91)  #
################################
#       versione 0.0.2         #
################################
````
Per aggiungere/modificare una risorsa docker all'infrastruttura, si possono modificare le configurazioni nel file `terraform.tfvars` 


Esempio di una singola configurazione: 
````
nome_servizio = {
    image                 = "nome-immagine-docker"  #immagine docker da utilizzare
    enabled               = true                    #abilita la configurazione corrente  (v0.0.2)
    enable_envs           = true                    #utilizza variabili d'ambiente
    enable_ports          = true                    #port mapping
    enable_volume_mount   = true                    #monta volume (bridge)
    enable_command        = false                   #esegui comandi personalizzati
    ports                 = {
        internal = 80                               #porta container
        external = 8080                             #porta esposta
    }
    volume_target_path    = "/var/www/html"         #path container
    volume_source_path    = "D:/path"               #path assoluto progetto/sorgenti
    env_vars              = ["TEST=ciao"]           #variabili d'ambiente
}
````

Utilizzo:
```
image                 (bool)  (obbligatorio)
enabled               (bool)  (obbligatorio)
enable_envs           (bool)  (obbligatorio)
enable_ports          (bool)  (obbligatorio)
enable_volume_mount   (bool)  (obbligatorio)
enable_command        (bool)  (obbligatorio)
enable_command        (bool)  (obbligatorio)

ports                 (object)        (opzionale)    enable_ports = false
volume_target_path    (string)        (opzionale)    enable_volume_mount = false
volume_source_path    (string)        (opzionale)    enable_volume_mount = false
env_vars              (list(string))  (opzionale)    enable_envs = false
commands              (list(string))  (opzionale)    enable_command = false
```

Immagini testate:
## php
- `php:8.3-apache`
- `php:7.2-apache`
- `php:5.5-apache`

## node
- `node:20.14.0-alpine3.20`
- `node:18.16.0-alpine`
- `node:16.18.0-alpine`

## database
-  `mariadb`  (port: 8306 user: root (default) password: password)
-  `postgres` (port: 8432 user: root (default) password: password)
-  `mongodb`  (port: 8017 user: username password: password)
-  `redis`    (port: 8379)

Una volta configurate le risorse, si possono eseguire le operazioni di creazione/modifica delle risorse all'interno dell'infrastruttura lanciando lo script batch `deploy.bat`
Si possono rimuovere le risorse all'interno dell'infrastruttura lanciando lo script batch `destroy.bat`

N.B. Per un corretto funzionamento è richiesto docker installato e configurato