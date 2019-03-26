#!/bin/bash

MSB_IP=`echo $MSB_ADDR | cut -d: -f 1`
MSB_PORT=`echo $MSB_ADDR | cut -d: -f 2`

if [ $MSB_IP ]; then
    sed -i "s|MSB_SERVICE_IP.*|MSB_SERVICE_IP = '$MSB_IP'|" vfc/gvnfm/vnfmgr/mgr/mgr/pub/config/config.py
fi

if [ $MSB_PORT ]; then
    sed -i "s|MSB_SERVICE_PORT.*|MSB_SERVICE_PORT = '$MSB_PORT'|" vfc/gvnfm/vnfmgr/mgr/mgr/pub/config/config.py
fi

if [ $SERVICE_IP ]; then
    sed -i "s|\"ip\": \".*\"|\"ip\": \"$SERVICE_IP\"|" vfc/gvnfm/vnfmgr/mgr/mgr/pub/config/config.py
fi

# Configure MYSQL
MYSQL_IP=`echo $MYSQL_ADDR | cut -d: -f 1`
MYSQL_PORT=`echo $MYSQL_ADDR | cut -d: -f 2`
echo "MYSQL_ADDR=$MYSQL_ADDR"

MYSQL_USER=`echo $MYSQL_AUTH | cut -d: -f 1`
MYSQL_ROOT_PASSWORD=`echo $MYSQL_AUTH | cut -d: -f 2`

REDIS_IP=`echo $REDIS_ADDR | cut -d: -f 1`
REDIS_PORT=`echo $REDIS_ADDR | cut -d: -f 2`

sed -i "s|DB_IP.*|DB_IP = '$MYSQL_IP'|" vfc/gvnfm/vnfmgr/mgr/mgr/pub/config/config.py
sed -i "s|DB_PORT.*|DB_PORT = $MYSQL_PORT|" vfc/gvnfm/vnfmgr/mgr/mgr/pub/config/config.py
sed -i "s|REDIS_HOST.*|REDIS_HOST = '$REDIS_IP'|" vfc/gvnfm/vnfmgr/mgr/mgr/pub/config/config.py
sed -i "s|REDIS_PORT.*|REDIS_PORT = '$REDIS_PORT'|" vfc/gvnfm/vnfmgr/mgr/mgr/pub/config/config.py
sed -i "s|DB_USER.*|DB_USER = '$MYSQL_USER'|" vfc/gvnfm/vnfmgr/mgr/mgr/pub/config/config.py
sed -i "s|DB_PASSWD.*|DB_PASSWD = '$MYSQL_ROOT_PASSWORD'|" vfc/gvnfm/vnfmgr/mgr/mgr/pub/config/config.py


cat vfc/gvnfm/vnfmgr/mgr/mgr/pub/config/config.py
