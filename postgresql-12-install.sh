#!/bin/bash
yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
 sudo yum -y install epel-release yum-utils
 sudo yum-config-manager --enable pgdg12
 sudo  yum -y install postgresql12-server postgresql12-contrib postgresql12
 sudo /usr/pgsql-12/bin/postgresql-12-setup initdb
 sudo systemctl enable --now postgresql-12
 systemctl status postgresql-12
 sudo firewall-cmd --add-service=postgresql --permanent
 sudo firewall-cmd --reload
 cd /var/lib/pgsql/12/data/
 sed -i 's/#listen_addresses/listen_addresses/g' postgresql.conf
 sed -i "s/'localhost'/'`hostname -I | awk '{print $1}'`'/g" postgresql.conf
 sed -i 's/#port/port/g' postgresql.conf
 sed -i '676s/#shared_preload_libraries/shared_preload_libraries/' postgresql.conf
 sed -i "676s/''/'pg_stat_statements'/" postgresql.conf
 sed  -i'678i track_activity_query_size = 2048'  postgresql.conf
 sed  -i '677i pg_stat_statements.track = all' postgresql.conf
 systemctl restart  postgresql-12.service
 systemctl status  postgresql-12.service