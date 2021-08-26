 #!/bin/bash
 yum install gcc pcre-devel tar make -y
 yum install haproxy -y 
 systemctl enable haproxy
 systemctl start haproxy
#cat >> /etc/haproxy/haproxy.cfg <<EOL
#frontend main
#    bind *:80
#    option http-server-close
#    option forwardfor
#    default_backend app-main
#
##---------------------------------------------------------------------
## BackEnd roundrobin as balance algorithm
##---------------------------------------------------------------------
#backend app-main
#    balance roundrobin                                     #Balance algorithm
#    option httpchk HEAD / HTTP/1.1\r\nHost:\ localhost   
#    server nginx1 $ip1:80 check
#    server nginx2 $ip2:80 check
#EOL

sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-port=8181/tcp
sudo firewall-cmd --reload
 systemctl status  haproxy