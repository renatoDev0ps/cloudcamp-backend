#!/bin/bash
#Pull de configs do S3
aws s3 cp s3://configs-cloudurbans/vhost/vhost.conf /tmp/000-default.conf
aws s3 cp s3://configs-cloudurbans/variables/env.config /tmp/.env
mv /tmp/000-default.conf /etc/apache2/sites-available/
mv /tmp/.env /var/www/cloudcamp-backend/


#Limpando memoria
sync; echo 1 > /proc/sys/vm/drop_caches
sync; echo 2 > /proc/sys/vm/drop_caches
sync; echo 3 > /proc/sys/vm/drop_caches


#Setando permissões antes do composer install
sudo chown -R www-data:www-data /var/www/cloudcamp-backend
sudo chmod -R 777 /var/www/cloudcamp-backend


#Instalando dependencias
cd /var/www/cloudcamp-backend
composer install


#Limpando memoria
sync; echo 1 > /proc/sys/vm/drop_caches
sync; echo 2 > /proc/sys/vm/drop_caches
sync; echo 3 > /proc/sys/vm/drop_caches

#Instalando dependencias
sudo php artisan migrate
composer require predis/predis

#Setando permissões depois do composer install
sudo chown -R www-data:www-data /var/www/cloudcamp-backend
sudo chmod -R 777 /var/www/cloudcamp-backend
