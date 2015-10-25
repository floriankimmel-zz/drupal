#!/bin/sh -e

echo "============================"
echo "Welcome to Installer 1.0"
echo "============================"
if [ ! -e "config/application.properties" ]
then
    echo "ERROR: Please create application.properties in folder config"
    echo "-------------------------------------------------"
    echo "Example Content would be: "
    echo "#mysql"
    echo "host=127.0.0.1"
    echo "user=root"
    echo "pwd="
    echo "database=drupal"
    echo "-------------------------------------------------"

    exit 1;
fi

# Script used to read Property File
. config/application.properties

if [ "$1" = "install" ] 
then
    if ! mysql -u $user -e "use $database" &>/dev/null; 
    then
      cp drupal/sites/default/default.settings.php drupal/sites/default/settings.php
      if [ "$pwd" = "" ] 
      then
        echo "create database $database;" | mysql -u $user
        cd drupal
        drush site-install custom --db-url="mysql://$user@$host/$database" -y
      else
        echo "create database $database;" | mysql -u $user -p $pwd
        cd drupal
        drush site-install custom --db-url="mysql://$user:$pwd@$host/$database" -y
      fi    
      drush upwd --password="admin" "admin"
      drush en site_deployment -y
    else
      echo "Already installed."
    fi
elif [ "$1" = "uninstall" ] 
then
    if ! mysql -u $user -e "use $database" &>/dev/null; 
    then
        echo "Bereits deinstalliert"
    else 
        if [ "$pwd" = "" ] 
        then
            echo "drop database $database;" | mysql -u $user
        else
            echo "drop database $database;" | mysql -u $user -p $pwd
        fi    
        rm drupal/sites/default/settings.php
    fi   
elif [ "$1" = "update" ] 
then    
    cd drupal
    drush vset maintenance_mode 1
    cd ..
    git pull
    cd drupal
    drush updb -y
    drush cc all
    drush cron
    drush vset maintenance_mode 0    
else    
    echo "sh ./installer.sh install | update"
fi    