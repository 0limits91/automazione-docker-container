@echo off 
echo ################################
echo # AUTOMAZIONE CONTAINER DOCKER #
echo #  FRANCESCO CAPPA (fcappa91)  #
echo ################################
echo #       versione 0.0.3         #
echo ################################ 
echo #           DEPLOY             #
echo ################################ 

terraform.exe init
terraform.exe apply -auto-approve