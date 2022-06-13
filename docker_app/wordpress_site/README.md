# Local KLRE website setup using docker for MAC/Linux

This module will help setup a local docker service with KLRE website.
* /init/
    * init-db-script.tar.gz: Initial DB setup SQL script copied from staging. The host is db entries is changed from staging.kltsv.com to localhost:8000
    * plugins.tar.gz: Includes all the plugins required to support the KLRE website.
    * themes.tar.gz: Includes all the themes required to support KLRE website.
    * uploads.tar.gz: Includes all the images and media files to support KLRE website.
    
* docker-compose.yaml
    * Docker compose file which creates a wordpress site service
    * Spins a wordpress site with, mysql server and phymyadmin locally
    * Site : localhost:8000 
    * phpmyadmin: localhost:8080/wp-admin
    * WP-Admin: localhost:8000/fdgkjhsdfg 
    
* init-setup.sh
    * Script file that is responsible for pulling the repo, extracting the init folder files and making it ready for docker compose to initiate.
    
* clean-up.sh
    * Script file that is responsible for deleting generated files and start fresh.
    
# STEP #1: Pre-requisites
* Install git locally and make sure your github user/handle has access to KrisLindahlCom repository in Github. Please reach out to KLRE team if you do not have access.
* Install docker 

# STEP #2: Run init-setup.sh script
* Make sure init-setup.sh script is executable. <chmod +x init-setup.sh>
* Run the init-setup.sh script to download the repo and unpack the compressed files.

# STEP #3: Run docker-compose
* Run [docker-compose up -d] to spin up the docker service. 
* NOTE: The mysql db service will take some time to run the init.script. You can check the service logs to find out when it completes or wait for 30 seconds.
* Open localhost:8000 in browser and you should be good to go.


# STEP #4: Making code changes
* Local docker has its wp-content volume pointed at the downloaded KrisLindahlCom github repository for certain plugins that are tracked. 
* Changes in the repo should get picked up and reflected by the docker service setup locally.
