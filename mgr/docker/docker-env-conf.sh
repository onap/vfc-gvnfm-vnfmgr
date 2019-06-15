#!/bin/bash

install_sf(){

    apk --no-cache update
    apk --no-cache add bash curl gcc wget mysql-client openssl-dev
    apk --no-cache add python-dev libffi-dev musl-dev py2-virtualenv

    # get binary zip from nexus
    wget -q -O vfc-gvnfm-vnfmgr.zip "https://nexus.onap.org/service/local/artifact/maven/redirect?r=snapshots&g=org.onap.vfc.gvnfm.vnfmgr.mgr&a=vfc-gvnfm-vnfmgr-mgr&v=${pkg_version}-SNAPSHOT&e=zip" && \
    unzip vfc-gvnfm-vnfmgr.zip && \
    rm -rf vfc-gvnfm-vnfmgr.zip
    wait
    pip install --upgrade setuptools pip
    pip install --no-cache-dir --pre -r  /service/vfc/gvnfm/vnfmgr/mgr/requirements.txt
}

add_user(){

    apk --no-cache add sudo
    addgroup -g 1000 -S onap
    adduser onap -D -G onap -u 1000
    chmod u+w /etc/sudoers
    sed -i '/User privilege/a\\onap    ALL=(ALL:ALL) NOPASSWD:ALL' /etc/sudoers
    chmod u-x /etc/sudoers
    sudo chown onap:onap -R /service
}

config_logdir(){

    if [ ! -d "/var/log/onap" ]; then
       sudo mkdir /var/log/onap
    fi 
   
    sudo chown onap:onap -R /var/log/onap
    chmod g+s /var/log/onap
    
}

clean_sf_cache(){

    rm -rf /var/cache/apk/*
    rm -rf /root/.cache/pip/*
    rm -rf /tmp/*
}

install_sf
wait
add_user
config_logdir
clean_sf_cache

