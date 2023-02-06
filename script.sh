#! /bin/sh
sed -i 's/$this->user="root";/$this->user="'${USUARIO_BOOKMEDIK}'";/g' /var/www/html/core/controller/Database.php
sed -i 's/$this->pass="";/$this->pass="'${CONTRA_BOOKMEDIK}'";/g' /var/www/html/core/controller/Database.php
sed -i 's/$this->host="localhost";/$this->host="'${DATABASE_HOST}'";/g' /var/www/html/core/controller/Database.php
sed -i 's/$this->ddbb="";/$this->ddbb="'${NOMBRE_DB}'";/g' /var/www/html/core/controller/Database.php
sleep 5

while ! mysql -u $USUARIO_BOOKMEDIK --password=$CONTRA_BOOKMEDIK -h $DATABASE_HOST -e ";" ;
do sleep 1
done

mysql -u $USUARIO_BOOKMEDIK --password=$CONTRA_BOOKMEDIK -h $DATABASE_HOST $NOMBRE_DB < /var/www/html/schema.sql
/usr/sbin/apache2ctl -D FOREGROUND

