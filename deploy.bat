@echo off 
echo ################################
echo # AUTOMAZIONE CONTAINER DOCKER #
echo #  FRANCESCO CAPPA (fcappa91)  #
echo ################################
echo #       versione 0.0.1         #
echo ################################ 

terraform.exe init
terraform.exe destroy -auto-approve
terraform.exe apply -auto-approve